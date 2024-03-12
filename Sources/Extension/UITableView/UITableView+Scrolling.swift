//
//  UITableView+Scrolling.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UITableView {
    func safeScrollToRow(
        at indexPath: IndexPath,
        at scrollPosition: UITableView.ScrollPosition,
        animated: Bool
    ) {
        guard indexPath.section < numberOfSections else { return }
        guard indexPath.row < numberOfRows(inSection: indexPath.section) else { return }
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }
}
