//
//  SearchHomeHeaderRankCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/03.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit

class SearchHomeHeaderRankCell: UITableViewCell {

    @IBOutlet private weak var rankLabel: UILabel!
    @IBOutlet private weak var companyName: UILabel!
    @IBOutlet private weak var rankState: UILabel!
    
    var data: SearchHome.Ranking.Item? {
        didSet {
            guard let data = data else { return }
            rankLabel.text = "\(data.ranking)"
            companyName.text = data.companyName
//            rankState.text = data.ra
        }
    }
}
