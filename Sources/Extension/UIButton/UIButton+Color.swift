//
//  UIButton+Color.swift
//
//
//  Created by mohamed sliem on 11/03/2024.
//

import UIKit

extension UIButton{
    
    public func setButton(
        backgroundColor: UIColor? = .white,
        tintColor: UIColor? = .blue,
        backgroundAlpha: CGFloat = 1,
        tintAlpha: CGFloat = 1
    ){
        self.backgroundColor = backgroundColor?.withAlphaComponent(backgroundAlpha)
        self.tintColor = tintColor?.withAlphaComponent(tintAlpha)
    }
    
    public func setTitleColor(_ color: UIColor, state: UIControl.State){
        setTitleColor(color, for: state)
    }
    
    public func setTitleColor(for states: [UIControl.State: UIColor]){
        for state in states {
            setTitleColor(state.value, for: state.key)
        }
    }
}
