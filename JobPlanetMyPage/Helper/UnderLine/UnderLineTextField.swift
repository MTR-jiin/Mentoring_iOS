//
//  UnderLineTextField.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/09.
//

import Foundation
import UIKit

struct UnderLineData {
    let title: String
    let placeholder: String
    var filledState: Bool?
}

protocol UnderLineTextFieldDelegate: AnyObject {
    func underLineDidChange(sender: UITextField)
}

class UnderLineTextField: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var lineView: UIView!
    public weak var delegate: UnderLineTextFieldDelegate?
        
    public var data: UnderLineData? {
        didSet {
            guard let data = data else { return }
            configure(infoData: data)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
        self.textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    convenience init(infoData: UnderLineData) {
        self.init(frame: .zero)
        configure(infoData: infoData)
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
    
    private func configure(infoData: UnderLineData) {
        self.titleLabel.text = infoData.title
        self.textField.placeholder = infoData.placeholder
//        self.data?.filledState = !(infoData.filledState ?? false)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if sender.text?.isEmpty == false{
            lineView.backgroundColor = UIColor(named: "lightGreen")
            data?.filledState = true
        } else {
            lineView.backgroundColor = .systemGray5
            data?.filledState = false
        }
        delegate?.underLineDidChange(sender: sender)
    }
}
