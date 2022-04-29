//
//  ViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/28.
//

import UIKit

struct listInfo {
    var title: String
    var subDetail: String?
}

class MypageViewController: UIViewController {

    @IBOutlet weak var mypageTableView: UITableView!
    
    private var myPageTableList: [listInfo] = [listInfo(title: "gray"),
                                           listInfo(title: "계정"),
                                           listInfo(title: "활동내역"),
                                           listInfo(title: "제휴대학교 정보"),
                                           listInfo(title: "gray"),
                                           listInfo(title: "받은제안", subDetail: "구글코리아 외 4개"),
                                           listInfo(title: "gray"),
                                           listInfo(title: "팔로잉 기업", subDetail: "잡플래닛 외 1개"),
                                           listInfo(title: "관심 직종", subDetail: "UI/UX/GUI디자인 외 3개"),
                                           listInfo(title: "관심 산업군", subDetail: "IT/웹/통신"),
                                           listInfo(title: "gray"),
                                           listInfo(title: "내강좌"),
                                           listInfo(title: "gray")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mypageTableView.dataSource = self
        mypageTableView.delegate = self
        
    }


}

extension MypageViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 14
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "MyProfileTableViewCell", for: indexPath) as! ProfileFirstTableViewCell
            profileCell.myProfileImageView.image = UIImage(named: "me")
            profileCell.myProfileJobInfo.text = "7년차 - 사진/포토그래퍼/카메라기자"
            return profileCell
        }
        else {
            let title = myPageTableList[(indexPath.row)-1].title
            let subDetail = myPageTableList[(indexPath.row)-1].subDetail
            if title == "gray" {
                let grayCell = tableView.dequeueReusableCell(withIdentifier: "GrayCell", for: indexPath)
                return grayCell
            } else {
                let listCell = tableView.dequeueReusableCell(withIdentifier: "MyPageListTableViewCell", for: indexPath) as! MyPageListTableViewCell
                listCell.titleLabel.text = title
                listCell.subDetailLabel.text = subDetail
                //다음 셀이 gray라면 선 없애기
                if myPageTableList[(indexPath.row)].title == "gray"{
                    listCell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: .greatestFiniteMagnitude)
                }
                return listCell
            }
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 175
        case 1,5,7,11,13:
            return 10;
        default:
            return 50
        }
    }
    
    
}


extension MypageViewController: UITableViewDelegate{
    
}

extension UIView{
    @IBInspectable var borderRadius: CGFloat {
            get {
                return layer.cornerRadius
            }
            set {
                layer.cornerRadius = newValue
                layer.masksToBounds = true
            }
        }
}
