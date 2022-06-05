//
//  SearchHomeHeaderRankCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/03.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit

protocol headerRank {
    var rankLabel: String { get }
    var companyName: String { get }
    var rankState: String { get }
}

class SearchHomeHeaderRankCell: UITableViewCell {

    @IBOutlet private weak var rankLabel: UILabel!
    @IBOutlet private weak var companyName: UILabel!
    @IBOutlet private weak var rankState: UILabel!
    
    func bind(to viewModel: headerRank) {
//        guard let viewModel = viewModel else { return }
        rankLabel.text = viewModel.rankLabel
        companyName.text = viewModel.companyName
    }

}
