//
//  UIView+Rounded.swift
//
//
//  Created by mohamed sliem on 11/03/2024.
//

import UIKit

extension UIView {
    
    @IBInspectable
    public var cornerRadius: CGFloat {
        get{
            return self.layer.cornerRadius
        }
        set{
           roundView(cornerRadius: newValue)
        }
    }
    
    public func roundView(cornerRadius: CGFloat){
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        self.setNeedsDisplay()
    }
    
    //Round only chosen corners
   public func round(corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(
            roundedRect: self.bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}
