//
//  UICollectionView+Dequeue.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UICollectionView {
    
    public func dequeueReusableCell<T: UICollectionViewCell>(withClass name: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "Couldn't find UICollectionViewCell for \(String(describing: name))")
        }
        return cell
    }
    
    public func dequeueReusableSupplementaryView<T: UICollectionReusableView>(ofKind kind: String, withClass name: T.Type,
                                                                              for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: String(describing: name),
            for: indexPath) as? T else {
            fatalError(
                "Couldn't find UICollectionReusableView for \(String(describing: name))")
        }
        return cell
    }
}
