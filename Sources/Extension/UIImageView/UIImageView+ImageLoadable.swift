//
//  File.swift
//  
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

public protocol ImageLoadable {
    func setImage(with url: URL?, placeholder: UIImage?, into imageView: UIImageView)
}
