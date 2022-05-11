//
//  MyPageSettingViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/04.
//

import UIKit
import TagListView

class MyPageSettingViewController: UIViewController {
    //Button
    @IBOutlet weak var saveButton: UIButton!
    //View
    @IBOutlet weak var tagListView: TagListView!
    var keyHeight: CGFloat?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        self.navigationController?.title = "마이페이지"
        makeTagListView()
    }
    
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
