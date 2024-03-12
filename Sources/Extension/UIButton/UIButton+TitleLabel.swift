//
//  UIButton.swift
//
//
//  Created by mohamed sliem on 11/03/2024.
//

import UIKit

extension UIButton {
    
    public func setTitle(_ text: String, for state: UIControl.State, font: UIFont){
            setTitle(text, for: state)
            titleLabel?.font = font
    }

    public func setTitle(for states: [UIControl.State: String], font: UIFont){
        for state in states {
            setTitle(state.value, for: state.key)
            titleLabel?.font = font
        }
    }
    
    public func setAlignment(for state: UIControl.State, textAlignment: NSTextAlignment){
        self.titleLabel?.textAlignment = textAlignment
    }
}
