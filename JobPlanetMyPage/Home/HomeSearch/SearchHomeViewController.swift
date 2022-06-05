//
//  SearchHomeViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/03.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit

class SearchHomeViewController: UIViewController {
    
    @IBOutlet weak var headerView: SearchHomeHeaderView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    private var delegate: SearchHomeHeaderDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }
//    
//    private func fetchData() {
//        repository.getRanking { result in
//            switch result {
//            case .success(let data):
//                self.viewModel = data.data.items
//            case .failure(let error):
//                debugPrint(error)
//            }
//        }
//    }
    
}

extension SearchHomeViewController: SearchHomeHeaderDelegate {
    func tappedCompanyRanking(_ sender: UIControl) {
        sender.addTarget(self, action: #selector(isFoldHeaderView(_:)), for: .touchUpInside)
    }
    
    @objc func isFoldHeaderView(_ btn: UIControl) {
        print("tapped")
        let fold = !self.headerView.isFold
        let height = !fold ? Self.Layout.headerClose : Self.Layout.headerOpen
        self.headerViewHeight.constant = height
        UIView.animate(withDuration: 0.3, animations: {
            self.headerView.isFold = fold
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
