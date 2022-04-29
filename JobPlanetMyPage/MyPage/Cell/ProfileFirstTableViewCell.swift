//
//  ProfileTableViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/29.
//

import UIKit

class ProfileFirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var myProfileImageView: UIImageView!
    @IBOutlet weak var myProfileJobInfo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }

}

