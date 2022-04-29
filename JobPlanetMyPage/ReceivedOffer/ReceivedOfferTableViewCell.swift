//
//  ReceivedOfferTableViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/29.
//

import UIKit

class ReceivedOfferTableViewCell: UITableViewCell {
    
    @IBOutlet weak var companyIcon: UIImageView!
//        didSet{
//            companyIcon.image = offerCompanyList[IndexPath.]
//        }
    
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var offeredDate: UILabel!
    //제안 상태
    @IBOutlet weak var offerStateView: UIView!
    @IBOutlet weak var offerStateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
