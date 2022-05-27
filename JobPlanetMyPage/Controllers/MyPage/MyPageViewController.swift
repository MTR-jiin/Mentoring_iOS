//
//  ViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/28.
//

import UIKit

final class MyPageViewController: UIViewController {
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
        case JobGroup = "직군별 만족도"
        
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
        .init(type: .JobGroup),
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
        let storyboard = UIStoryboard.init(name: "MypageSetting", bundle: nil)
        let settingVC = storyboard.instantiateViewController(withIdentifier: "MyPageSettingViewController") as! MyPageSettingViewController
        navigationController?.pushViewController(settingVC, animated: true)
    }
    

}

extension MyPageViewController: UITableViewDataSource{
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
    func makeStoryboard(name: String, type: MyPageViewController.MyPageListType) {
        let storyboard = UIStoryboard.init(name: "\(name)", bundle: nil)
        guard let offerVC = storyboard.instantiateViewController(withIdentifier: "\(name)ViewController") as? OfferViewController else { return }
        self.navigationController?.pushViewController(offerVC, animated: true)
        
    }
}

extension MyPageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellData = tableList[indexPath.row]
        switch cellData.type {
        //이거 재사용한 코드 만들기
        case .offer:
            let storyboard = UIStoryboard.init(name: "Offer", bundle: nil)
            guard let offerVC = storyboard.instantiateViewController(withIdentifier: "OfferViewController") as? OfferViewController else { return }
            offerVC.sentNavigationTitle = cellData.type.rawValue
            self.navigationController?.pushViewController(offerVC, animated: true)
        case .JobGroup:
            let storyboard = UIStoryboard.init(name: "JobGroup", bundle: nil)
            guard let jobVC = storyboard.instantiateViewController(withIdentifier: "JobGroupViewController") as? JobGroupViewController else { return }
            //데이터 전달
            jobVC.modalPresentationStyle = .fullScreen
            self.present(jobVC, animated: true)
            
            
        default: return
        }
    }
}
