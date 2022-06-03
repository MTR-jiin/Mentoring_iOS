//
//  SearchHomeHeaderRankCell.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/05/27.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit

final class SearchHomeHeaderRankCell: UITableViewCell {
    @IBOutlet private weak var rankingLabel: UILabel!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var fluctuationLabel: UILabel!
    @IBOutlet private weak var fluctuationImageView: UIImageView!
    @IBOutlet private weak var NEWLabel: UILabel!
    
    public func bind(item: SearchHomeHeaderDatable) {
        rankingLabel.text = "\(item.ranking)"
//        rankingLabel.textColor = item.rankingColor
        companyNameLabel.text = item.companyName
        fluctuationLabel.text = "\(item.fluctuation)"
//        fluctuationLabel.textColor = item.fluctuationTextColor
//        fluctuationImageView.image = item.fluctuationImage
//        fluctuationLabel.isHidden = !item.isHiddenNEW
//        fluctuationImageView.isHidden = !item.isHiddenNEW
//        NEWLabel.isHidden = viewModel.isHiddenNEW

    }

//    override func bind(to viewModel: CellModel) {
//        super.bind(to: viewModel)
//        guard let viewModel = viewModel as? NewsTabHeaderRankCellModel else { return }
//        rankingLabel.text = viewModel.ranking
//        rankingLabel.textColor = viewModel.rankingColor
//        companyNameLabel.text = viewModel.companyName
//        fluctuationLabel.text = viewModel.fluctuationText
//        fluctuationLabel.textColor = viewModel.fluctuationTextColor
//        fluctuationImageView.image = viewModel.fluctuationImage
//        fluctuationLabel.isHidden = !viewModel.isHiddenNEW
//        fluctuationImageView.isHidden = !viewModel.isHiddenNEW
//        NEWLabel.isHidden = viewModel.isHiddenNEW
//    }
}

