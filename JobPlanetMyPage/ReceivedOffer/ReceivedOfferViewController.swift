//
//  ReceivedOfferViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/29.
//

import UIKit

enum offerState{
    case permit, deny, none
}

struct companyData {
    var companyIcon: UIImage? = UIImage(systemName: "house")
    var companyName: String
    var offerDate: String
    var offerState: offerState
}

class ReceivedOfferViewController: UIViewController {
    
    @IBOutlet private weak var navigationTitle: UILabel!
    @IBOutlet private weak var offerListTableView: UITableView!
    @IBOutlet weak var navigationView: UIView!
    
    var sentNavigationTItle: String = ""
    var offerCompanyList: [companyData] = [
        companyData(companyName: "구글 코리아", offerDate: "2019. 08. 30", offerState: .none),
        companyData(companyIcon: UIImage(systemName: "house"), companyName: "드라마앤 컴패니", offerDate: "2019. 08. 30", offerState: .permit),
        companyData(companyIcon: UIImage(systemName: "house"), companyName: "(주)지그재그", offerDate: "2019. 08. 30", offerState: .deny),
        companyData(companyIcon: UIImage(systemName: "house"), companyName: "페이스북 코리아", offerDate: "2019. 08. 30", offerState: .deny)
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationTitle.text = sentNavigationTItle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.offerListTableView.dataSource = self
        navigationUnderLine(sendView: navigationView)
    }
    
    @IBAction func backNaviBtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
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
        //제안 상태에 따른 색상 변경
        
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
        
//        companyData.offerState ??  ? changeOfferState(bgColor: .blue, textColor: .green, labelText: "수락함") : changeOfferState(bgColor: .systemGray5, textColor: .systemGray, labelText: "거절함")

        
    }
    
    
    
    
    
}
