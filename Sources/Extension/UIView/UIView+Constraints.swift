//
//  UIView.swift
//
//
//  Created by mohamed sliem on 11/03/2024.
//

import UIKit

extension UIView{
    
    //MARK: - Anchors Constraints
    public func setConstraints(
        top: NSLayoutYAxisAnchor? = nil, topRelation: ConstraintsRelation = .Equal, paddingTop: CGFloat = 0,
        bottom: NSLayoutYAxisAnchor? = nil, bottomRelation: ConstraintsRelation = .Equal, paddingBottom: CGFloat = 0,
        leading: NSLayoutXAxisAnchor? = nil, leadingRelation: ConstraintsRelation = .Equal, paddingLeading: CGFloat = 0,
        trailing: NSLayoutXAxisAnchor? = nil, trailingRelation: ConstraintsRelation = .Equal, paddingTrailing: CGFloat = 0
    ){
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            setVerticalAnchor(for: topAnchor, relation: topRelation, to: top, padding: paddingTop)
        }
        
        if let bottom = bottom {
            setVerticalAnchor(for: bottomAnchor, relation: bottomRelation ,to: bottom, padding: -paddingBottom)
        }
        
        if let leading = leading {
            setHorizontalAnchor(for: leadingAnchor, relation: leadingRelation, to: leading, padding: paddingLeading)
        }
        
        if let trailing = trailing {
            setHorizontalAnchor(for: trailingAnchor, relation: trailingRelation, to: trailing, padding: -paddingTrailing)
        }
    }
    
    private func setVerticalAnchor(
        for viewAnchor: NSLayoutYAxisAnchor,
        relation: ConstraintsRelation = .Equal,
        to relativeAnchor: NSLayoutYAxisAnchor,
        padding: CGFloat
    ){
        
    }
    
    private func setHorizontalAnchor(
        for viewAnchor: NSLayoutXAxisAnchor,
        relation: ConstraintsRelation = .Equal,
        to relativeAnchor: NSLayoutXAxisAnchor,
        padding: CGFloat
    ){
        switch relation{
        case .GreaterOrEqual:
            viewAnchor.constraint(greaterThanOrEqualTo: relativeAnchor, constant: padding).isActive = true
        case .Equal:
            viewAnchor.constraint(equalTo: relativeAnchor, constant: padding).isActive = true
        case .LessOrEqual:
            viewAnchor.constraint(lessThanOrEqualTo: relativeAnchor, constant: padding).isActive = true
        }
    }
    
    //MARK: - Size Anchors
    public func setWidth(widthPadding: CGFloat, widthRelation: ConstraintsRelation){
        setSizeConstraints(for: widthAnchor, sizeRelation: widthRelation, paddingSize: widthPadding)
    }
    
    public func setHeight(heightPadding: CGFloat, heightRelation: ConstraintsRelation){
        setSizeConstraints(for: heightAnchor, sizeRelation: heightRelation, paddingSize: heightPadding)
    }
    
    private func setSizeConstraints(
        for sizeAnchor: NSLayoutDimension,
        sizeRelation: ConstraintsRelation,
        paddingSize: CGFloat
    ){
        switch sizeRelation {
            case .GreaterOrEqual:
                sizeAnchor.constraint(greaterThanOrEqualToConstant: paddingSize).isActive = true
            case .Equal:
                sizeAnchor.constraint(equalToConstant: paddingSize).isActive = true
            case .LessOrEqual:
                sizeAnchor.constraint(lessThanOrEqualToConstant: paddingSize).isActive = true
        }
    }
    
    func center(
        centerX : NSLayoutXAxisAnchor? = nil, paddingX : CGFloat? = nil ,
        centerY : NSLayoutYAxisAnchor? = nil, paddingY : CGFloat? = nil
    ){
        translatesAutoresizingMaskIntoConstraints = false
        
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX , constant: paddingX ?? 0).isActive = true
        }
        
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY , constant: paddingY ?? 0).isActive = true
        }
    }
    
}
