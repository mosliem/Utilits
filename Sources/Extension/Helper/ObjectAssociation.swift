//
//  File.swift
//  
//
//  Created by mohamed sliem on 12/03/2024.
//

import Foundation


public final class ObjectAssociation<T> {

    private let policy: objc_AssociationPolicy

    public init(policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC) {
        self.policy = policy
    }
    
    public subscript(index: AnyObject) -> T? {

        get {
            return objc_getAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque()) as! T?
        }
        set {
            objc_setAssociatedObject(index, Unmanaged.passUnretained(self).toOpaque(), newValue, policy)
        }
    }
}
