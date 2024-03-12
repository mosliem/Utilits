//
//  ImageDownloader.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit
import Kingfisher

public class ImageDownloader: ImageLoadable {
    public init(){}
    public func setImage(with url: URL?, placeholder: UIImage?, into imageView: UIImageView) {
        imageView.kf.setImage(with: url, placeholder: placeholder)
    }
}

