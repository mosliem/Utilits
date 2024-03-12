//
//  UICollectionView+Register.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UICollectionView {
    
    public func register<T: UICollectionReusableView>(
        supplementaryViewOfKind kind: String,
        withClass name: T.Type
    ) {
        register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
    }
    
    public func register<T: UICollectionViewCell>(nib: UINib?, forCellWithClass name: T.Type) {
        register(nib, forCellWithReuseIdentifier: String(describing: name))
    }
    
    public func register<T: UICollectionViewCell>(cellWithClass name: T.Type) {
        register(T.self, forCellWithReuseIdentifier: String(describing: name))
    }
    
    public func register<T: UICollectionReusableView>(
        nib: UINib?,
        forSupplementaryViewOfKind kind: String,
        withClass name: T.Type
    ) {
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: String(describing: name))
    }
    
    public func register<T: UICollectionViewCell>(
        nibWithCellClass name: T.Type,
        at bundleClass: AnyClass? = nil
    ) {
        let identifier = String(describing: name)
        var bundle: Bundle?
        
        if let bundleName = bundleClass {
            bundle = Bundle(for: bundleName)
        }
        register(UINib(nibName: identifier, bundle: bundle), forCellWithReuseIdentifier: identifier)
    }
}
