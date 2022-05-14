//
//  JobGroupTableViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/14.
//

import UIKit

class JobGroupTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 5)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}