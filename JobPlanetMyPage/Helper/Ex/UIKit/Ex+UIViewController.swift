//
//  Ex+UIViewController.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/04/30.
//

import UIKit

extension UIViewController {
    func navigationUnderLine(sendView: UIView) {
        let border = CALayer()
        border.frame = CGRect(x: 0, y: sendView.frame.size.height-1, width: sendView.frame.width, height: 0.3)
        border.borderWidth = 0.3
        border.borderColor = UIColor.systemGray4.cgColor
        sendView.layer.addSublayer(border)
    }
}
