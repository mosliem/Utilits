//
//  File.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UIScrollView {
    
    public func scrollToView(view: UIView, animated: Bool) {
        if let origin = view.superview {
            UIView.animate(withDuration: 0.4, animations: {
                // Get the Y position of the child view
                let childStartPoint = origin.convert(view.frame.origin, to: self)
                // Scroll to a rectangle starting at the Y of subview, with a height of the scrollview
                self.scrollRectToVisible(CGRect(x: 0, y: childStartPoint.y, width: 1, height: self.frame.height), animated: animated)
            })
        }
    }
    
    public func scrollTo(horizontalOffset: CGFloat, animated: Bool) {
        let desiredOffset = CGPoint(x: horizontalOffset, y: contentOffset.y)
        setContentOffset(desiredOffset, animated: animated)
    }
    
    public func scrollTo(verticalOffset: CGFloat, animated: Bool) {
        let desiredOffset = CGPoint(x: contentOffset.x, y: verticalOffset)
        setContentOffset(desiredOffset, animated: animated)
    }
    
    public func scrollToTop(animated: Bool) {
        let topOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(topOffset, animated: animated)
    }
    
    public func scrollToBottom() {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height + contentInset.bottom)
        if(bottomOffset.y > 0) {
            setContentOffset(bottomOffset, animated: true)
            
        }
    }
    
}
