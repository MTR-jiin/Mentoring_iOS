//
//  InfinityCollectionViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/16.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit
import Kingfisher

protocol SearchHomeHeaderHeadLineDatable {
    var titleRow1: String { get }
    var titleRow2: String { get }
    var thumbnail: String { get }
}

class InfinityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    func bind(to viewModel: SearchHomeHeaderHeadLineDatable) {
        let url = URL(string: viewModel.thumbnail)
        imageView.kf.setImage(with: url)
    }

}
