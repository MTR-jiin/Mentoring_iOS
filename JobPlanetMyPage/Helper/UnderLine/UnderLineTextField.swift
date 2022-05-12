//
//  UnderLineTextField.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/09.
//

import Foundation
import UIKit

class UnderLineTextField: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lineView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        self.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }

    private func loadView() {
        guard let xibName = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last,
              let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
    private func loadViewFromNib(nib: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nib, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func configure(infoData: textFieldInfo) {
        self.titleLabel.text = infoData.title
        self.textField.placeholder = infoData.placeHolder
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if sender.text != "" {
            lineView.backgroundColor = UIColor(named: "lightGreen")
        } else {
            lineView.backgroundColor = .systemGray5
        }
    }
}

