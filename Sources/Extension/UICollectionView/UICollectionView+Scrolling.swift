//
//  UICollectionView+Scrolling.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UICollectionView {
    public func safeScrollToItem(
        at indexPath: IndexPath,
        at scrollPosition: UICollectionView.ScrollPosition,
        animated: Bool
    ) {
        guard indexPath.item >= 0,
              indexPath.section >= 0,
              indexPath.section < numberOfSections,
              indexPath.item < numberOfItems(inSection: indexPath.section) else {
            return
        }
        scrollToItem(at: indexPath, at: scrollPosition, animated: animated)
    }
}
