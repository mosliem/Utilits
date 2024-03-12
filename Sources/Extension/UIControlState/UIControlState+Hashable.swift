//
//  UIControlState+Hashable.swift
//
//
//  Created by mohamed sliem on 11/03/2024.
//

import UIKit

extension UIControl.State: Hashable{
    public var hashValue: Int{
        return Int(rawValue)
    }
}
