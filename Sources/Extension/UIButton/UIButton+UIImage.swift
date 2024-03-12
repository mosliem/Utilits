//
//  File.swift
//  
//
//  Created by mohamed sliem on 11/03/2024.
//

import UIKit

extension UIButton {
    
    public func setImage(_ image: UIImage, state: UIControl.State){
        setImage(image, for: state)
    }
    
    public func setImage(for states: [UIControl.State : UIImage]){
        for state in states {
            setImage(state.value, for: state.key)
        }
    }
    
    public func setSFImage(
        systemName: String,
        pointSize: CGFloat,
        weight: UIImage.SymbolWeight,
        scale: UIImage.SymbolScale,
        renderingMode: UIImage.RenderingMode,
        state: UIControl.State
    )
    {
        let sfImage = UIImage().SFImage(
            systemName: systemName,
            pointSize: pointSize,
            weight: weight,
            scale: scale,
            renderingMode: renderingMode
        )
        setImage(sfImage, for: state)
    }
}
