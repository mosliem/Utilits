//
//  File.swift
//  
//
//  Created by mohamed sliem on 20/05/2024.
//

import Foundation
import UIKit

extension UIView {
    
    public func addHorizonalGradientLayer(
        with colors: [UIColor],
        locations: [NSNumber]
    ) {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        
        gradient.colors = colors
        gradient.locations = locations
        
        gradient.startPoint = CGPoint(x: 0, y: 1)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        gradient.frame = self.frame
        self.layer.addSublayer(gradient)
    }
    
    public func addVerticalGradientLayer(
        with colors: [UIColor],
        locations: [NSNumber]
    ) {
        let gradient = CAGradientLayer()
        gradient.type = .axial
        
        gradient.colors = colors
        gradient.locations = locations
        
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        
        gradient.frame = self.frame
        self.layer.addSublayer(gradient)
    }
}
