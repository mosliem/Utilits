//
//  UINavigationBar.swift
//  
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit


extension UINavigationBar {
    
    public func setTitle(with font: UIFont, color: UIColor?) {
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = font
        attributes[.foregroundColor] = color
        titleTextAttributes = attributes
    }

    public func makeTransparent(with tint: UIColor?) {
        isTranslucent = true
        backgroundColor = .clear
        barTintColor = .clear
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        
        guard let color = tint else {return}
        tintColor = color
        titleTextAttributes = [.foregroundColor: color]
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
