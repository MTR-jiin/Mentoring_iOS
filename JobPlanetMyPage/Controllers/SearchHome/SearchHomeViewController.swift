//
//  SearchHomeViewController.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/05/27.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import RxSwift
import HeadPageKit
import RxHeadPageKit

final class SearchHomeViewController: HeadPageViewController {
    @IBOutlet private weak var headerView: SearchHomeHeaderView!
    @IBOutlet private weak var headerViewHeight: NSLayoutConstraint!
    private let menuView = MenuView(parts:
        .normalTextColor(JobPlanetMyPageAsset.ColorPalettes.gray200.color),
        .selectedTextColor(JobPlanetMyPageAsset.ColorPalettes.gray800.color),
        .normalTextFont(UIFont.systemFont(ofSize: 16)),
        .selectedTextFont(UIFont.boldSystemFont(ofSize: 16)),
        .switchStyle(.line), .itemSpace(32),
        .sliderStyle(.init(parts:
            .height(2.0),
            .position(.bottom),
            .extraWidth(16.0))
        )
    )
    
    private let viewModel: SearchHomeViewModel = .init()
    private let disposeBag: DisposeBag = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        bind()
    }
}

extension SearchHomeViewController {
    private func setupLayout() {
        
    }
    
    private func bind() {
        let requestRank = headerView.dropDownButton.rx.throttleTap
            .do(onNext: { [weak self] in self?.toggleHeaderView() })
        

        let input: SearchHomeViewModel.Input = .init(
            loadPage: rx.viewWillAppear.mapTo(()),
            requestRank: requestRank
        )
        
        let output = viewModel.transform(input: input)
        output.rankData.bind(to: headerView.rx.items).disposed(by: disposeBag)
        output.configuration
            .map { [weak self] in
            .init(originIndex: $0.index,
                  menuView: self?.menuView,
                  menuTitles: $0.menuTitles,
                  menuHeight: $0.menuHeight,
                  menuViewPinHeight: $0.menuPinHeight,
                  contentInset: $0.contentInset,
                  viewControllers: $0.viewControllers)
            }
            .bind(to: rx.configuration())
            .disposed(by: disposeBag)
    }
    
    
    
    private func toggleHeaderView() {
        let isFold = !headerView.isFold
        let height = isFold ? Self.Layout.headerClose : Self.Layout.headerOpen
        headerViewHeight.constant = height
        UIView.animate(withDuration: 0.3, animations: {
            self.headerView.isFold = isFold
            self.view.layoutIfNeeded()
        })
    }
}

extension SearchHomeViewController {
    struct Layout {
        static let headerOpen: CGFloat = 343.0
        static let headerClose: CGFloat = 84.0
    }
}
