//
//  MyPageSettingViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/04.
//

import UIKit
import TagListView

class MyPageSettingViewController: UIViewController {
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var tagListView: TagListView!
    @IBOutlet private weak var navigationView: UIView!
    
    @IBOutlet private weak var myPageStackView: UIStackView!
    
    private var inputInfoList = [
        UnderLineData(title: "이름 (필수)", placeholder: "예) 김잡플"),
        UnderLineData(title: "이메일 (필수)", placeholder: "예) kj980926@naver.com"),
        UnderLineData(title: "연락처 (필수)", placeholder: "예) 01011112222"),
        UnderLineData(title: "성별 (필수)", placeholder: "예) 남/여"),
        UnderLineData(title: "출생년도 (필수)", placeholder: "예) 1998년"),
        UnderLineData(title: "총 경력 (필수)", placeholder: "예) 7년차"),
        UnderLineData(title: "현재(관심)직종 (필수)", placeholder: "예) iOS개발자")
    ]
    
    private var textFieldList = [UITextField]()
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.title = "마이페이지"
        configureStackView()
        makeTagListView()
        navigationUnderLine(sendView: navigationView)
        hideKeyboardWhenTappedBackground()
    }
    
    //스택 뷰 구성
    private func configureStackView() {
        inputInfoList.enumerated().forEach {
            let makeView = UnderLineTextField()
            makeView.data = $1
//            UnderLineTextField(infoData: $1)
            textFieldList.append(makeView.textField)
//            makeView.textField.delegate = self
            makeView.textField.returnKeyType = .next
            if $0 == 0 {
                makeView.textField.becomeFirstResponder()
            }
            myPageStackView.insertArrangedSubview(makeView, at: $0)
        }
    }

    
    //MARK: - private funcb
    //태그 리스트 구성
    private func makeTagListView() {
        let tagList = ["UI디자인", "UX/UI디자인", "디자인", "RxSwift", "AutoLayout", "illustrator", "Sketch", "SwiftUI", "UIKit"]
        tagList.forEach {
            tagListView.addTag($0)
        }
    }
    
    @IBAction private func tappedBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

//빈 화면 터치시 키보드 내림
extension UIViewController {
    func hideKeyboardWhenTappedBackground() {
         let tapEvent = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
         tapEvent.cancelsTouchesInView = false
         view.addGestureRecognizer(tapEvent)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

//extension MyPageSettingViewController: UITextFieldDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        switch textField {
//        case textField.title
//        }
//    }
//}
