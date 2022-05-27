//
//  Ex+UIView.swift
//  JobPlanetMyPage
//
//  Created by moon.kwon on 2022/04/30.
//

import UIKit

extension UIView {
    @IBInspectable var borderRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }
}
