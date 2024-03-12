//
//  UITextField+Padding.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UITextField {
    public func addPadding(side: PaddingSide, _ padding: CGFloat) {
        let paddingFrame = CGRect(x: 0, y: 0, width: padding, height: self.frame.height)
        let paddingView = UIView(frame: paddingFrame)
        
        switch side {
            case .left:
                leftViewMode = .always
                leftView = paddingView
            case .right:
                rightViewMode = .always
                rightView = paddingView
            case .both:
                rightView = paddingView
                leftView = paddingView
                leftViewMode = .always
                rightViewMode = .always
        }
    }
}
