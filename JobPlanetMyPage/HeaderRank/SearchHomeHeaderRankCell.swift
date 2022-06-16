//
//  SearchHomeHeaderRankCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/03.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit

protocol SearchHomeHeaderDatable {
    var ranking: Int { get }
    var companyName: String { get }
    var fluctuation: Int { get }
}

class SearchHomeHeaderRankCell: UITableViewCell {

    @IBOutlet private weak var rankLabel: UILabel!
    @IBOutlet private weak var companyName: UILabel!
    @IBOutlet private weak var rankState: UILabel!
    
    func bind(to viewModel: SearchHomeHeaderDatable) {
        rankLabel.text = String(viewModel.ranking)
        companyName.text = viewModel.companyName
    }

}
