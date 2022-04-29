//
//  ReceivedOfferViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/29.
//

import UIKit

final class ReceivedOfferViewController: UIViewController {
    // state를 enum 으로 처리하는 거 아주 좋았습니다 :)
    enum OfferState{
        case permit, deny, none
    }

    // 하지만 앞 문자는 대문자로 조금만 더 신경 써주시면 좋을 거 같아용
    struct CompanyData {
        var companyIcon: UIImage? = UIImage(systemName: "house")
        var companyName: String
        var offerDate: String
        var offerState: OfferState
    }
    
    @IBOutlet private weak var navigationTitle: UILabel!
    @IBOutlet private weak var offerListTableView: UITableView!
    @IBOutlet private weak var navigationView: UIView!
    
    public var sentNavigationTItle: String = ""
    private var offerCompanyList: [CompanyData] = [
        CompanyData(companyName: "구글 코리아", offerDate: "2019. 08. 30", offerState: .none),
        CompanyData(companyIcon: UIImage(systemName: "house"), companyName: "드라마앤 컴패니", offerDate: "2019. 08. 30", offerState: .permit),
        CompanyData(companyIcon: UIImage(systemName: "house"), companyName: "(주)지그재그", offerDate: "2019. 08. 30", offerState: .deny),
        CompanyData(companyIcon: UIImage(systemName: "house"), companyName: "페이스북 코리아", offerDate: "2019. 08. 30", offerState: .deny)
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationTitle.text = sentNavigationTItle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        offerListTableView.dataSource = self
        navigationUnderLine(sendView: navigationView)
    }
    
    // 얘도 private가 된답니당 ~
    @IBAction private func backNaviBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension ReceivedOfferViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return offerCompanyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let offerCell = tableView.dequeueReusableCell(withIdentifier: "ReceivedOfferTableViewCell", for: indexPath) as! ReceivedOfferTableViewCell
        let companyData = offerCompanyList[indexPath.row]
        offerCell.companyIcon.image = companyData.companyIcon
        offerCell.companyName.text = companyData.companyName
        offerCell.offeredDate.text = companyData.offerDate

        func changeOfferState(bgColor: UIColor, textColor: UIColor, labelText: String) {
            offerCell.offerStateView.backgroundColor = bgColor
            offerCell.offerStateLabel.text = labelText
            offerCell.offerStateLabel.textColor = textColor
        }
        
        switch companyData.offerState {
        case .none: break
        case .permit:
            changeOfferState(bgColor: UIColor(named: "lightBlue")!, textColor: UIColor(named: "lightGreen")!, labelText: "수락함")
        case .deny:
            changeOfferState(bgColor: .systemGray5, textColor: .systemGray, labelText: "거절함")
        }
        
        return offerCell
    }
}
