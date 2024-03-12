//
//  UITableView+Dequeue.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UITableView {
    
    public func dequeueReusableCell<T: UITableViewCell>(withClass name: T.Type) -> T {
        
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name)) as? T else {
            fatalError(
                "Couldn't find UITableViewCell for \(String(describing: name))"
            )
        }
        return cell
    }
    
    public func dequeueReusableCell<T: UITableViewCell> (
        withClass name: T.Type,
        for indexPath: IndexPath
    ) -> T {
        
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: name), for: indexPath) as? T else {
            fatalError(
                "Couldn't find UITableViewCell for \(String(describing: name))"
            )
        }
        return cell
    }
    
    public func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withClass name: T.Type) -> T {
        
        guard let headerFooterView = dequeueReusableHeaderFooterView(
            withIdentifier: String(describing: name)
        ) as? T else {
            fatalError("Couldn't find UITableViewHeaderFooterView for \(String(describing: name))")
        }
        return headerFooterView
    }
    
    
}
