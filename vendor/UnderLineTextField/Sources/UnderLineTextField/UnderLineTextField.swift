//
//  UnderLineTextField.swift
//  JobPlanetMyPage
//
//  Created by 김지인 on 2022/05/09.
//

import UIKit

public struct UnderLineData {
    public let title: String
    public let placeholder: String
    public var filledState: Bool?
    
    public init(title: String, placeholder: String, filledState: Bool? = nil) {
        self.title = title
        self.placeholder = placeholder
        self.filledState = filledState
    }
}

public protocol UnderLineTextFieldDelegate: AnyObject {
    func underLineDidChange(sender: UITextField)
}

public class UnderLineTextField: UIView {
    
    @IBOutlet public weak var titleLabel: UILabel!
    @IBOutlet public weak var textField: UITextField!
    @IBOutlet public weak var lineView: UIView!
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
              let view = Bundle.module.loadNibNamed(xibName, owner: self, options: nil)?.first as? UIView else { return }
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
            lineView.backgroundColor = UIColor(red: 0.0, green: 195.0 / 255.0, blue: 98.0 / 255.0, alpha: 1.0)
            data?.filledState = true
        } else {
            lineView.backgroundColor = UIColor(red: 229.0 / 255.0, green: 230.0 / 255.0, blue: 233.0 / 255.0, alpha: 1.0)
            data?.filledState = false
        }
        delegate?.underLineDidChange(sender: sender)
    }
}
