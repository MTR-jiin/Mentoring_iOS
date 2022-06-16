//
//  InfinityCollectionViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/06/16.
//  Copyright © 2022 JobPlanetMyPage. All rights reserved.
//

import UIKit

class InfinityCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    private let colors = [#colorLiteral(red: 0.5254901961, green: 0.6901960784, blue: 0.9137254902, alpha: 1), #colorLiteral(red: 0.5254901961, green: 0.6196078431, blue: 0.9137254902, alpha: 1), #colorLiteral(red: 0.6078431373, green: 0.5254901961, blue: 0.9137254902, alpha: 1), #colorLiteral(red: 0.9137254902, green: 0.5254901961, blue: 0.8392156863, alpha: 1), #colorLiteral(red: 0.9137254902, green: 0.5254901961, blue: 0.6, alpha: 1), #colorLiteral(red: 0.9137254902, green: 0.6784313725, blue: 0.5254901961, alpha: 1), #colorLiteral(red: 0.9137254902, green: 0.9058823529, blue: 0.5254901961, alpha: 1), #colorLiteral(red: 0.5254901961, green: 0.9137254902, blue: 0.5921568627, alpha: 1), #colorLiteral(red: 0.5254901961, green: 0.8, blue: 0.9137254902, alpha: 1)]
    private let images = [UIImage(systemName: "pencil"),
                        UIImage(systemName: "square.and.arrow.down.on.square.fill")]
    
//    func update(idx: Int) {
//        self.backgroundColor = colors[idx % colors.count]
//        self.imageView.image = images[idx % images.count]
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
