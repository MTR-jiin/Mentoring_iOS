//
//  MyPageSettingViewController.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/04.
//

import UIKit

class MyPageSettingViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var careerTextField: UITextField!
    @IBOutlet weak var nowJobTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.isHidden = true
        configureUI()
        nameTextField.becomeFirstResponder()
        hideKeyboardWhenTappedBackground()
    }
    
    private func configureUI() {
        [nameTextField, emailTextField, phoneNumberTextField, genderTextField, birthTextField, careerTextField, nowJobTextField].forEach {
            $0?.makeUnderLine()
        }
    }

    @IBAction func tapBackBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

//텍스트 필드 밑줄 생성
extension UITextField {
    func makeUnderLine() {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.height - 1, width: self.frame.width - 25, height: 1.0)
        bottomLine.backgroundColor = UIColor.systemGray5.cgColor
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
