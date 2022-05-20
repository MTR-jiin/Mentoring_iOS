//
//  ReceivedOfferTableViewCell.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/29.
//

import UIKit

final class OfferTableViewCell: UITableViewCell {
    @IBOutlet private weak var companyIcon: UIImageView!
    @IBOutlet private weak var companyName: UILabel!
    @IBOutlet private weak var offeredDate: UILabel!
    //제안 상태
    @IBOutlet private weak var offerStateView: UIView!
    @IBOutlet private weak var offerStateLabel: UILabel!
    
    public var data: CompanyData? {
        didSet {
            guard let data = data else { return }
            companyIcon.image = data.companyIcon
            companyName.text = data.companyName
            offeredDate.text = data.offerDate
            switch data.offerState {
            case .permit:
                changeOfferState(bgColor: UIColor(named: "lightBlue")!, textColor: UIColor(named: "lightGreen")!, labelText: "수락함")
            case .deny:
                changeOfferState(bgColor: .systemGray5, textColor: .systemGray, labelText: "거절함")
            default: break
            }

        }
    }
    
    private func changeOfferState(bgColor: UIColor, textColor: UIColor, labelText: String) {
        offerStateView.backgroundColor = bgColor
        offerStateLabel.text = labelText
        offerStateLabel.textColor = textColor
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
