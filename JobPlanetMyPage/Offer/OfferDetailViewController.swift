//
//  OfferDetailViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/18.
//

import UIKit

final class OfferDetailViewController: UIViewController {

    @IBOutlet private weak var offerButtonsStackView: UIStackView!
    @IBOutlet private weak var offerDescriptionLabel: UILabel!
    @IBOutlet private weak var offerButtonsView: UIView!
    @IBOutlet private weak var navigationTitle: UILabel!
    
    var infoData: CompanyData = CompanyData(offerState: .none)
    var tableIndexPath: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeViewShadow()
        self.navigationTitle.text = infoData.companyName
    }

    
    private func makeViewShadow() {
        offerButtonsView.layer.shadowOpacity = 0.2
        offerButtonsView.layer.shadowOffset = CGSize(width:  0, height: -5)
        offerButtonsView.layer.shadowRadius = 5
        offerButtonsView.layer.shadowColor = UIColor.gray.cgColor
    }
    
    @IBAction private func tappedAcceptOrDenyBtn(_ sender: UIButton) {
        offerButtonsStackView.isHidden = true
        if sender.titleLabel?.text == "거절" {
            offerDescriptionLabel.tintColor = .gray
            offerDescriptionLabel.text = "거절한 제안입니다."
            infoData.offerState = .deny
        } else {
            offerDescriptionLabel.tintColor = UIColor(named: "lightGreen")
            offerDescriptionLabel.text = "수락한 제안입니다."
            infoData.offerState = .permit
        }
    }
    
    @IBAction private func tappedBackBtn(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "OfferViewController") as? OfferViewController else { return }
        print(infoData.offerState)
        print(tableIndexPath)
        vc.offerCompanyList[tableIndexPath].offerState = infoData.offerState
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
