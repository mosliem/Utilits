//
//  UIImageView.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UIImageView {
    public func setImage(downlaoder: ImageLoadable = ImageDownloader(), url: String, placeholder: UIImage? = nil) {
        guard let imageURL = URL (string: url) else {
            self.image = placeholder
            return
        }
        downlaoder.setImage(with: imageURL, placeholder: placeholder, into: self)
    }
}
