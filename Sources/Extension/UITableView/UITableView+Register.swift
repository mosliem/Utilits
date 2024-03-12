//
//  File.swift
//  
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UITableView {
    
    public func register<T: UITableViewHeaderFooterView>(nib: UINib?, withHeaderFooterViewClass name: T.Type) {
          register(nib, forHeaderFooterViewReuseIdentifier: String(describing: name))
      }

    public func register<T: UITableViewHeaderFooterView>(headerFooterViewClassWith name: T.Type) {
          register(T.self, forHeaderFooterViewReuseIdentifier: String(describing: name))
      }

    public func register<T: UITableViewCell>(cellWithClass name: T.Type) {
          register(T.self, forCellReuseIdentifier: String(describing: name))
      }

    public func register<T: UITableViewCell>(nib: UINib?, withCellClass name: T.Type) {
          register(nib, forCellReuseIdentifier: String(describing: name))
      }

    public func register<T: UITableViewCell>(nibWithCellClass name: T.Type, at bundleClass: AnyClass? = nil) {
          let identifier = String(describing: name)
          var bundle: Bundle?

          if let bundleName = bundleClass {
              bundle = Bundle(for: bundleName)
          }

          register(UINib(nibName: identifier, bundle: bundle), forCellReuseIdentifier: identifier)
      }
}
