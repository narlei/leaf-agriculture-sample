//
//  UIViewExtensions.swift
//  Leaf
//
//  Created by Narlei A Moreira on 27/10/20.
//

import UIKit
extension UIView {
    @IBInspectable var cornerRadiuss: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue

            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                layer.masksToBounds = true
            }
        }
    }

    @IBInspectable var shadow: Bool {
        get {
            return layer.shadowOpacity > 0.0
        }
        set {
            if newValue == true {
                addShadow()
            }
        }
    }

    func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                   shadowOffset: CGSize = CGSize(width: 1, height: 1),
                   shadowOpacity: Float = 0.5,
                   shadowRadius: CGFloat = 5) {
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
    }

    @IBInspectable var borderColor: CGColor {
        get {
            return layer.borderColor ?? UIColor.clear.cgColor
        }
        set {
            layer.borderColor = newValue

            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                layer.masksToBounds = true
            }
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue

            // Don't touch the masksToBound property if a shadow is needed in addition to the cornerRadius
            if shadow == false {
                layer.masksToBounds = true
            }
        }
    }
}
