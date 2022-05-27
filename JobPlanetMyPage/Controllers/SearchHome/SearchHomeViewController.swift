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
    
    private let disposeBag: DisposeBag = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView.dropDownButton.rx.throttleTap
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                let isFold = !self.headerView.isFold
                let height = isFold ? Self.Layout.headerClose : Self.Layout.headerOpen
                self.headerViewHeight.constant = height
                UIView.animate(withDuration: 0.3, animations: {
                    self.headerView.isFold = isFold
                    self.view.layoutIfNeeded()
                })
            })
            .disposed(by: disposeBag)
    }
}

extension SearchHomeViewController {
    struct Layout {
        static let headerOpen: CGFloat = 343.0
        static let headerClose: CGFloat = 84.0
    }
}
