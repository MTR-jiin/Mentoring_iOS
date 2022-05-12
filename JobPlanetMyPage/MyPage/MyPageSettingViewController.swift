//
//  MyPageSettingViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/04.
//

import UIKit
import TagListView

struct textFieldInfo {
    let title: String
    let placeHolder: String
    let underLine: LineColor
}

class MyPageSettingViewController: UIViewController {
    @IBOutlet private weak var saveButton: UIButton!
    @IBOutlet private weak var tagListView: TagListView!
    
    @IBOutlet private weak var myPageStackView: UIStackView!
    
    private var inputInfoList = [
        textFieldInfo(title: "이름 (필수)", placeHolder: "예) 김잡플", underLine: .gray),
        textFieldInfo(title: "이메일 (필수)", placeHolder: "예) kj980926@naver.com", underLine: .gray),
        textFieldInfo(title: "연락처 (필수)", placeHolder: "예) 01011112222", underLine: .gray),
        textFieldInfo(title: "성별 (필수)", placeHolder: "예) 남/여", underLine: .gray),
        textFieldInfo(title: "출생년도 (필수)", placeHolder: "예) 1998년", underLine: .gray),
        textFieldInfo(title: "총 경력(필수)", placeHolder: "예) 7년차", underLine: .gray),
        textFieldInfo(title: "현재(관심)직종 (필수)", placeHolder: "예) iOS개발자", underLine: .gray)
    ]
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.title = "마이페이지"
        configureStackView()
        makeTagListView()
    }
    
    //스택 뷰 구성
    private func configureStackView() {
        inputInfoList.enumerated().forEach {
            let test = makeTextField(data: $1)
            myPageStackView.insertArrangedSubview(test, at: $0)
        }
    }
    
    private func makeTextField(data: textFieldInfo) -> UnderLineTextField {
        let customTextField = UnderLineTextField()
        customTextField.configure(infoData: data)
        return customTextField
    }
    
    //태그 리스트 구성
    private func makeTagListView() {
        let tagList = ["UI디자인", "UX/UI디자인", "디자인", "RxSwift", "AutoLayout", "illustrator", "Sketch", "SwiftUI", "UIKit"]
        tagList.forEach {
            tagListView.addTag($0)
        }
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
