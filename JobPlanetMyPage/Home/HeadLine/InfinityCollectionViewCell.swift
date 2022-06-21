//
//  InfinityCollectionViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/16.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import Kingfisher


class InfinityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var nowIndexLabel: UILabel!
    @IBOutlet weak var totalIndexLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
        
    func bind(to viewModel: HeadLineCellDatable) {
//        nowIndexLabel.text = viewModel.nowIndex
        let url = URL(string: viewModel.thumbnail)
        imageView.kf.setImage(with: url)
    }

}
