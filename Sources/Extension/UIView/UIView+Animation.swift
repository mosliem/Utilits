//
//  UIView+Animation.swift
//
//
//  Created by mohamed sliem on 11/03/2024.
//

import UIKit

extension UIView {
    func stretchAnimate(duration: CGFloat, scaleX: CGFloat, scaleY: CGFloat){
        
        UIView.animate(
            withDuration: duration,
            animations:{
                    self.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
                },
            completion: { _ in
                UIView.animate(withDuration: duration) {
                    self.transform = .identity
                }
            })
    }
    
    func springAnimate(to position: CGPoint, duration: TimeInterval, damping: CGFloat, velocity: CGFloat) {
        UIView.animate(withDuration: duration,
                       delay: 0,
                       usingSpringWithDamping: damping,
                       initialSpringVelocity: velocity,
                       options: [.curveEaseInOut],
                       animations: {
            self.center = position
        }, completion: nil)
    }
    
}
