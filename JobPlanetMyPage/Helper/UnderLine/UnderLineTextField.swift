//
//  UnderLineTextField.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/09.
//

import Foundation
import UIKit

enum LineColor {
    case gray, green
}

class UnderLineTextField: UIView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var lineView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
//    convenience init(frame: CGRect, title: String, placeHolder: String, underLine: LineColor) {
//        self.init(frame: frame)
//        self.titleLabel.text = title
//        self.textField.placeholder = placeHolder
//        self.lineView.tintColor = underLine == .gray ? .systemGray5 : UIColor(named: "lightGreen")
//    }
//
    private func loadView() {
        guard let xibName = NSStringFromClass(self.classForCoder).components(separatedBy: ".").last,
              let view = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)?.first as? UIView else { return }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(view)
    }
    
    func loadViewFromNib(nib: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nib, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func configure(infoData: textFieldInfo) {
        self.titleLabel.text = infoData.title
        self.textField.placeholder = infoData.placeHolder
        self.lineView.tintColor = infoData.underLine == .gray ? .systemGray5 : UIColor(named: "lightGreen")
    }
        
}
