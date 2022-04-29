//
//  MyPageListTableViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/29.
//

import UIKit

class MyPageListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subDetailLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }

}
