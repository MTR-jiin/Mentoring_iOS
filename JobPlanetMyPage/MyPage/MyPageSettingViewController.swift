//
//  MyPageSettingViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/04.
//

import UIKit
import TagListView

class MyPageSettingViewController: UIViewController {
    //TextField
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var careerTextField: UITextField!
    @IBOutlet weak var nowJobTextField: UITextField!
    //Button
    @IBOutlet weak var saveButton: UIButton!
    //View
    @IBOutlet weak var tagListView: TagListView!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        configureUI()
        makeTagListView()
        nameTextField.becomeFirstResponder()
        hideKeyboardWhenTappedBackground()
    }
    //MARK: - Method
    private func configureUI() {
        saveButton.isEnabled = false
        [nameTextField, emailTextField, phoneNumberTextField, genderTextField, birthTextField, careerTextField, nowJobTextField].forEach {
            $0?.makeUnderLine(.systemGray4)
            $0?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
        birthTextField.text = "1998년"
    }
    
    private func makeTagListView() {
        let tagList = ["UI디자인", "UX/UI디자인", "디자인", "RxSwift", "AutoLayout", "illustrator", "Sketch", "SwiftUI", "UIKit"]
        tagList.forEach {
            tagListView.addTag($0)
        }
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        sender.text != "" ? sender.makeUnderLine(UIColor(named: "lightGreen")!) : sender.makeUnderLine(.systemGray4)
        guard
            let name = nameTextField.text, !name.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let phone = phoneNumberTextField.text, !phone.isEmpty,
            let gender = genderTextField.text, !gender.isEmpty,
            let birth = birthTextField.text, !birth.isEmpty,
            let career = careerTextField.text, !career.isEmpty,
            let nowJob = nowJobTextField.text, !nowJob.isEmpty
        else {
            saveButton.isEnabled = false
            return
        }
        saveButton.isEnabled = true
        saveButton.tintColor = UIColor(named: "lightGreen")
    }

    //MARK: - IBAction
    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func enabledSaveBtn(_ sender: UIButton) {
        if nameTextField.text != "" && emailTextField.text != "" {
            sender.isEnabled = true
            sender.tintColor = .red
        }
    }
}

//MARK: - Extenstion
//텍스트 필드 밑줄 생성
extension UITextField {
    func makeUnderLine(_ color: UIColor) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width - 25, height: 1.0)
        bottomLine.backgroundColor = color.cgColor
        borderStyle = UITextField.BorderStyle.none
        layer.addSublayer(bottomLine)
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
