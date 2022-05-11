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
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var careerTextField: UITextField!
    @IBOutlet weak var nowJobTextField: UITextField!
    //Label
    @IBOutlet weak var genderLabel: UILabel!
    //Button
    @IBOutlet weak var saveButton: UIButton!
    //View
    @IBOutlet weak var tagListView: TagListView!
    var keyHeight: CGFloat?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        configureUI()
        makeTagListView()
        settingKeyboard()
    }
  
    //MARK: - Method
    private func configureUI() {
        saveButton.isEnabled = false
        [nameTextField, emailTextField, phoneNumberTextField, birthTextField, careerTextField, nowJobTextField].forEach {
            $0?.makeUnderLine(.systemGray4)
            $0?.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        }
        genderLabel.makeUnderLine(.systemGray4)
        tappedGenderLabel()
    }
    
    private func settingKeyboard() {
        nameTextField.becomeFirstResponder()
        hideKeyboardWhenTappedBackground()
        [nameTextField, emailTextField, phoneNumberTextField, birthTextField, careerTextField, nowJobTextField].forEach {
            $0?.delegate = self
            $0?.returnKeyType = .next
        }
    }
    
    private func makeTagListView() {
        let tagList = ["UI디자인", "UX/UI디자인", "디자인", "RxSwift", "AutoLayout", "illustrator", "Sketch", "SwiftUI", "UIKit"]
        tagList.forEach {
            tagListView.addTag($0)
        }
    }

    private func tappedGenderLabel() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(selectedGender))
        genderLabel.isUserInteractionEnabled = true
        genderLabel.addGestureRecognizer(tap)
        
    }
    //MARK: - @objc method
    //성별 라벨 탭할시
    @objc func selectedGender(sender: UITapGestureRecognizer) {
        let alert = UIAlertController(title: "성별 선택", message: nil, preferredStyle: .actionSheet)
        let male = UIAlertAction(title: "남자", style: .default) { action in
            self.genderLabel.text =  action.title
            self.genderLabel.textColor = .black
        }
        let female = UIAlertAction(title: "여자", style: .default) { action in
            self.genderLabel.text =  action.title
            self.genderLabel.textColor = .black
        }
        alert.addAction(male)
        alert.addAction(female)
        self.present(alert, animated: true)
        //🚨alert창 내려지고 초록색으로 바껴야 되는데, 뜨자마자 바껴버림 ㅠㅠ
        self.genderLabel.makeUnderLine(UIColor(named: "lightGreen")!)
       
    }
    //텍스트 필드 변하는거 감지
    @objc func textFieldDidChange(sender: UITextField) {
        sender.text != "" ? sender.makeUnderLine(UIColor(named: "lightGreen")!) : sender.makeUnderLine(.systemGray4)
        guard
            let name = nameTextField.text, !name.isEmpty,
            let email = emailTextField.text, !email.isEmpty,
            let phone = phoneNumberTextField.text, !phone.isEmpty,
            let gender = genderLabel.text, !gender.isEmpty,
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
            sender.tintColor = UIColor(named: "lightGreen")
        }
    }
}

//MARK: - Extenstion
extension MyPageSettingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            emailTextField.becomeFirstResponder()
        case emailTextField:
            phoneNumberTextField.becomeFirstResponder()
        case phoneNumberTextField:
            birthTextField.becomeFirstResponder()
        case birthTextField:
            careerTextField.becomeFirstResponder()
        default:
            careerTextField.resignFirstResponder()
        }
        return true
    }
}

//텍스트 필드 밑줄 생성
extension UIView {
    func makeUnderLine(_ color: UIColor) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width - 25, height: 1.0)
        bottomLine.backgroundColor = color.cgColor
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
