//
//  SearchHomeViewController.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/05/27.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import RxSwift

final class SearchHomeViewController: UIViewController {
    @IBOutlet private weak var headerView: SearchHomeHeaderView!
    @IBOutlet private weak var headerViewHeight: NSLayoutConstraint!
    
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
            requestRank: requestRank
        )
        
        let output = viewModel.transform(input: input)
        output.rankData.bind(to: headerView.rx.items).disposed(by: disposeBag)
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
