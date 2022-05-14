//
//  ViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/28.
//

import UIKit

final class MypageViewController: UIViewController {
    @IBOutlet private weak var mypageTableView: UITableView!
    @IBOutlet private weak var navigationView: UIView!
 
    enum MyPageListType: String {
        case header, line = ""
        case account = "계정"
        case activity = "활동내역"
        case university = "제휴대학교 정보"
        case offer = "받은 제안"
        case following = "팔로잉 기업"
        case occupation = "관심 직종"
        case industry = "관심 산업군"
        case lecture = "내 강좌"
        case satisfaction = "직군별 만족도"
        
        var cellIdentifer: String {
            switch self {
            case .header: return "MyProfileTableViewCell"
            case .line: return "GrayCell"
            default: return "MyPageListTableViewCell"
            }
        }
    }
    
    struct ListData {
        let type: MyPageListType
        let data: Any?
        
        init(type: MyPageListType, data: Any? = nil) {
            self.type = type
            self.data = data
        }
    }
            
    private let tableList: [ListData] = [
        .init(type: .header),
        .init(type: .line),
        .init(type: .account),
        .init(type: .activity),
        .init(type: .university),
        .init(type: .line),
        .init(type: .satisfaction),
        .init(type: .line),
        .init(type: .offer, data: "구글코리아 외 4개"),
        .init(type: .line),
        .init(type: .following, data: "잡플래닛 외 1개"),
        .init(type: .occupation, data: "UI/UX/GUI디자인 외 3개"),
        .init(type: .industry, data: "IT/웹/통신"),
        .init(type: .line),
        .init(type: .lecture, data: "내 강좌"),
        .init(type: .line)
    ]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mypageTableView.dataSource = self
        mypageTableView.delegate = self
        navigationUnderLine(sendView: navigationView)
    }
    
    @IBAction func tappedSettingBtn(_ sender: UIButton) {
        let settingVC = self.storyboard?.instantiateViewController(withIdentifier: "MyPageSettingViewController") as! MyPageSettingViewController
        navigationController?.pushViewController(settingVC, animated: true)
    }
    

}

extension MypageViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellData = tableList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellData.type.cellIdentifer, for: indexPath)
        
        if var cell = cell as? CellDataProtocol {
            cell.data = cellData
        }
        return cell
    }
    
}

extension MypageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = tableList[indexPath.row]
        switch cellData.type {
        case .offer:
            guard let offerVC = self.storyboard?.instantiateViewController(withIdentifier: "ReceivedOfferViewController") as? ReceivedOfferViewController else { return }
            offerVC.sentNavigationTItle = cellData.type.rawValue
            self.navigationController?.pushViewController(offerVC, animated: true)
        case .satisfaction:
            guard let jobVC = self.storyboard?.instantiateViewController(withIdentifier: "JobGroupViewController") as? JobGroupViewController else { return }
            //데이터 전달
            self.navigationController?.pushViewController(jobVC, animated: true)
        default: return
        }
    }
}
