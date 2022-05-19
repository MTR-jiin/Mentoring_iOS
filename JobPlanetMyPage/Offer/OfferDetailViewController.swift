//
//  OfferDetailViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/18.
//

import UIKit

class OfferDetailViewController: UIViewController {

    @IBOutlet weak var offerButtonsStackView: UIStackView!
    @IBOutlet weak var offerDescriptionLabel: UILabel!
    @IBOutlet weak var offerButtonsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeViewShadow()
        
    }
    private func makeViewShadow() {
        offerButtonsView.layer.shadowOpacity = 0.2
        offerButtonsView.layer.shadowOffset = CGSize(width:  0, height: -5)
        offerButtonsView.layer.shadowRadius = 5
        offerButtonsView.layer.shadowColor = UIColor.gray.cgColor
    }
    
    @IBAction func tappedAcceptOrDenyBtn(_ sender: UIButton) {
        offerButtonsStackView.isHidden = true
        if sender.titleLabel?.text == "거절" {
            offerDescriptionLabel.tintColor = .gray
            offerDescriptionLabel.text = "거절한 제안입니다."
        } else {
            offerDescriptionLabel.tintColor = UIColor(named: "lightGreen")
            offerDescriptionLabel.text = "수락한 제안입니다."
        }
    }
    
    @IBAction func tappedBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
