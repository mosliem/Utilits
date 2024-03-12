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
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layoutAttachAll()
        return contentView
    }
    
    public func layoutAttachAll() {
        setConstraints(
            top: self.topAnchor,
            paddingTop: 0,
            bottom: self.bottomAnchor,
            paddingBottom: 0,
            leading: self.leadingAnchor,
            paddingLeading:0,
            trailing: self.trailingAnchor,
            paddingTrailing: 0
        )
    }
    
}
