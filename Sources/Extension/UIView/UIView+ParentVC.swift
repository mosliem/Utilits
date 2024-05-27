//
//  File.swift
//  
//
//  Created by mohamed sliem on 27/05/2024.
//

import UIKit

extension UIView {
   public var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
