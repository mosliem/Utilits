//
//  UIImage+SFSymobl.swift
//
//
//  Created by mohamed sliem on 11/03/2024.
//

import UIKit

extension UIImage {
    
    public func SFImage(
        systemName: String,
        pointSize: CGFloat,
        weight: UIImage.SymbolWeight,
        scale: UIImage.SymbolScale,
        renderingMode: UIImage.RenderingMode
    ) -> UIImage
    {
        let imageConfig = UIImage.SymbolConfiguration(
            pointSize: pointSize,
            weight: weight,
            scale: scale
        )
        
        let sfImage = UIImage(
            systemName: systemName,
            withConfiguration: imageConfig
        )?.withRenderingMode(renderingMode) ?? UIImage()
        
        return sfImage
    }
    
    public func scaleImage(_ scale: CGFloat) -> UIImage? {
        let scaledHeight = self.size.height * scale
        let scaledWidth = self.size.width * scale
        
        UIGraphicsBeginImageContext(CGSize(width: scaledWidth, height: scaledHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: scaledWidth, height: scaledHeight))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        return newImage
    }
}
