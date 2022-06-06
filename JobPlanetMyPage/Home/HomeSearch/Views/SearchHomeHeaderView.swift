//
//  SearchHomeHeaderView.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/03.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit

protocol SearchHomeHeaderDelegate: AnyObject {
    func tappedCompanyRanking()
}

class SearchHomeHeaderView: DesignView {

    @IBOutlet private weak var searchBar: UIControl!
    @IBOutlet private weak var companyListDropDown: UIControl!
    @IBOutlet private weak var dropImage: UIImageView!
    @IBOutlet public weak var tableView: UITableView!
    @IBOutlet private weak var underLineView: UIView!
    
    private let repository = SearchHomeRepostiory()
    public var delegate: SearchHomeHeaderDelegate?

    public var isFold: Bool = false {
        didSet {
            let image = isFold ? "chevron.down" : "chevron.up"
            dropImage.image = UIImage(systemName: image)
            tableView.isHidden = !isFold
            underLineView.isHidden = !isFold
        }
    }

    
    private func registerXib() {
        let nibName = UINib(nibName: "SearchHomeHeaderRankCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "SearchHomeHeaderRankCell")
    }
    
    override func loaded() {
        super.loaded()
        registerXib()
        companyListDropDown.addTarget(self, action: #selector(tappedDropDown), for: .touchUpInside)
    }
    
    @objc func tappedDropDown() {
        print("view - tapped")
        delegate?.tappedCompanyRanking()
    }
}
