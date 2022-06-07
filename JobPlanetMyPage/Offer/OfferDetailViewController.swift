//
//  OfferDetailViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/18.
//

import UIKit

protocol OfferDetailViewDelegate: AnyObject {
    func closeCompanyData(_ data: CompanyData)
}

final class OfferDetailViewController: UIViewController {
    @IBOutlet private weak var offerButtonsStackView: UIStackView!
    @IBOutlet private weak var offerDescriptionLabel: UILabel!
    @IBOutlet private weak var offerButtonsView: UIView!
    @IBOutlet weak var navigationView: NavigationView!
    
    
    var infoData: CompanyData = CompanyData(offerState: .none)
    public weak var delegate: OfferDetailViewDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeViewShadow()
        setup(data: infoData)
    }

    public func setup(data: CompanyData) {
        print("")
        navigationView.title = data.companyName
        navigationView.delegate = self
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
    
}

extension OfferDetailViewController: NavigationDelegate {
    func tappedBack() {
        delegate?.closeCompanyData(infoData)
        self.navigationController?.popViewController(animated: true)
    }
}
