//
//  UINavigationBar.swift
//  
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit


extension UINavigationBar {
    
    public func setTitle(with font: UIFont, color: UIColor = .black) {
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = font
        attributes[.foregroundColor] = color
        titleTextAttributes = attributes
    }

    public func makeTransparent(with tint: UIColor = .white) {
        isTranslucent = true
        backgroundColor = .clear
        barTintColor = .clear
        setBackgroundImage(UIImage(), for: .default)
        tintColor = tint
        titleTextAttributes = [.foregroundColor: tint]
        shadowImage = UIImage()
    }
    
    public func setColor(for background: UIColor, text: UIColor) {
        isTranslucent = false
        backgroundColor = background
        barTintColor = background
        setBackgroundImage(UIImage(), for: .default)
        tintColor = text
        titleTextAttributes = [.foregroundColor: text]
    }
}
