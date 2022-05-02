//
//  ViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/04/28.
//

import UIKit

// TODO: 네비게이션 컨트롤러로 구현하지 않았네용~ 네비게이션 컨트롤러 구현부탁드려용
// TODO: 노치가 없는 폰에서는 상단 부분이 어색해요 한 번 확인해보시고 수정해보세용
// 화면도 이쁘게 잘 만드셨고 UI부분은 잘하셨습니다 :) 고생많으셨고요. TODO로 처리한 부분 한 번 고민해보시고 푸시해주세용!!

final class MypageViewController: UIViewController {
    // 해당 클래스에서만 사용될 거 같으면 아래 처럼 구속시키는 것이 좋아요.
    struct ListInfo {
        var title: String
        var subDetail: String?
    }

    @IBOutlet private weak var mypageTableView: UITableView!
    @IBOutlet private weak var navigationView: UIView!
    
    private var myPageTableList: [ListInfo] = [ListInfo(title: "gray"),
                                           ListInfo(title: "계정"),
                                           ListInfo(title: "활동내역"),
                                           ListInfo(title: "제휴대학교 정보"),
                                           ListInfo(title: "gray"),
                                           ListInfo(title: "받은 제안", subDetail: "구글코리아 외 4개"),
                                           ListInfo(title: "gray"),
                                           ListInfo(title: "팔로잉 기업", subDetail: "잡플래닛 외 1개"),
                                           ListInfo(title: "관심 직종", subDetail: "UI/UX/GUI디자인 외 3개"),
                                           ListInfo(title: "관심 산업군", subDetail: "IT/웹/통신"),
                                           ListInfo(title: "gray"),
                                           ListInfo(title: "내 강좌"),
                                           ListInfo(title: "gray")]
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mypageTableView.dataSource = self
        mypageTableView.delegate = self
        navigationUnderLine(sendView: navigationView)
    }

}

extension MypageViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPageTableList.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // TODO: ReceivedOfferTableViewCell해당 셀처럼 캡슐화해서 처리해보세요.
        // TODO: indexPath나 title로 구분 짓는 것 보단 enum으로 처리하는 법도 있는데 할 수 있으면 해보시고, 나중에 피드백 드릴게요!
        if indexPath.row == 0 {
            let profileCell = tableView.dequeueReusableCell(withIdentifier: "MyProfileTableViewCell", for: indexPath) as! ProfileFirstTableViewCell
            profileCell.myProfileImageView.image = UIImage(named: "me")
            profileCell.myProfileJobInfo.text = "7년차 - 사진/포토그래퍼/카메라기자"
            return profileCell
        } else {
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
    
}

extension MypageViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO: indexPath나 title로 구분 짓는 것 보단 enum으로 처리하는 법도 있는데 할 수 있으면 해보시고, 나중에 피드백 드릴게요!
        // TODO: out of range가 발생해요 indexPath.row가 0인데 -1를 계산해서 발생했어요
        let title = myPageTableList[(indexPath.row)-1].title
        if title == "받은 제안" {
            guard let offerVC = self.storyboard?.instantiateViewController(withIdentifier: "ReceivedOfferViewController") as? ReceivedOfferViewController else { return }
            offerVC.sentNavigationTItle = title
            offerVC.modalTransitionStyle = .crossDissolve
            offerVC.modalPresentationStyle = .fullScreen
            self.present(offerVC, animated: true, completion: nil)
        }
    }
}
