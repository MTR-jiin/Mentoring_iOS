//
//  MyPageListTableViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/29.
//

import UIKit

class MyPageListTableViewCell: UITableViewCell, CellDataProtocol {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subDetailLabel: UILabel!
    
    var data: Any? {
        didSet {
            guard let data = data as? MypageViewController.ListData else { return }
            titleLabel.text = data.type.rawValue
            subDetailLabel.text = data.data as? String
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        selectionStyle = .none
    }

}
