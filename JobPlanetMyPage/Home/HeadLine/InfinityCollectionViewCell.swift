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
    
    private let viewModel = HeadLineViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        totalIndexLabel.text = String(viewModel.itemCount)
    }
        
    func bind(data: HeadLineCellDatable, row: Int) {
        let url = URL(string: data.thumbnail)
        imageView.kf.setImage(with: url)
        nowIndexLabel.text = String(viewModel.itemCount % row)
    }
}
