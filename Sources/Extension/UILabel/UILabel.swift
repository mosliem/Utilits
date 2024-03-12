//
//  File.swift
//  
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UILabel {
    
    public convenience init(font: UIFont, color: UIColor, alignment: NSTextAlignment) {
        self.init()
        self.font = font
        self.textColor = color
        self.textAlignment = alignment
    }

}
