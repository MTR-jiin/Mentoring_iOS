//
//  JobGroupTableViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/14.
//

import UIKit

class JobGroupTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var percentLabel: UILabel!
    @IBOutlet private weak var progressBar: UIProgressView!
    
    public var data: CellData? {
        didSet {
            guard let data = data else { return }
            titleLabel.text = data.title
            percentLabel.text = "\(data.rating)"
            progressBar.progress = data.rating / 5
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        progressBar.layer.cornerRadius = 5
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 5
        progressBar.subviews[1].clipsToBounds = true
        
    }

}
