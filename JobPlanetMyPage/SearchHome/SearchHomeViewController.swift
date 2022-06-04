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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerView.companyListDropDown.addTarget(self, action: #selector(tappedDropDown(_:)), for: .touchUpInside)
    }
    
    @objc func tappedDropDown(_ btn: UIControl) {
        let fold = !self.headerView.isFold
        let height = !fold ? Self.Layout.headerClose : Self.Layout.headerOpen
        self.headerView.isFold = fold
        self.headerViewHeight.constant = height
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.layoutIfNeeded()
//        })
    }

}

extension SearchHomeViewController {
    struct Layout {
        static let headerOpen: CGFloat = 343.0
        static let headerClose: CGFloat = 84.0
    }
}
