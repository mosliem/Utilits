//
//  UILabel+Size.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UILabel {
    
    public func getEstimatedHeight() -> CGFloat {
        return sizeThatFits(CGSize(width: self.frame.width, height: CGFloat.greatestFiniteMagnitude)).height
    }

    public func getEstimatedWidth() -> CGFloat {
        return sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude, height: self.frame.height)).width
    }

}
