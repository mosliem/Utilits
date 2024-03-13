//
//  UIView+Nib.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UIView {
    @discardableResult
    public func fromNib<T : UIView>() -> T? {
        
        guard let contentView = Bundle(for: type(of: self))
            .loadNibNamed(String(describing: type(of: self)),
                          owner: self)?.first as? T
        else {
            return nil
        }
        
        self.addSubview(contentView)
        contentView.setConstraints(
            top: topAnchor,
            bottom: bottomAnchor,
            leading: leadingAnchor,
            trailing: trailingAnchor
        )
        return contentView
    }
    
}
