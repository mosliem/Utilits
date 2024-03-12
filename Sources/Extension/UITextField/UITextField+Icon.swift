//
//  File.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UITextField {
    
    private static let iconPaddingAssociation = ObjectAssociation<CGFloat>()
    private static let iconDirectionAssociation = ObjectAssociation<IconSide>()
    private static let IconImageAssocaiation = ObjectAssociation<UIImage>()
   
    @IBInspectable var iconPadding: CGFloat {
        get{
            return UITextField.iconPaddingAssociation[self] ?? 5
        }
        set{
            UITextField.iconPaddingAssociation[self] = newValue
        }
    }
    
    @IBInspectable var iconDirection: IconSide {
        get{
            return UITextField.iconDirectionAssociation[self] ?? .left
        }
        set{
            UITextField.iconDirectionAssociation[self] = newValue
        }
    }
    
    @IBInspectable var IconImage: UIImage {
        get{
            return UITextField.IconImageAssocaiation[self] ?? UIImage()
        }
        set{
            UITextField.IconImageAssocaiation[self] = newValue
            addIcon(newValue, padding: iconPadding, side: iconDirection)
        }
    }
    
    public func addIcon(_ image: UIImage, padding: CGFloat, side: IconSide) {
        let frame = CGRect(x: 0, y: 0, width: image.size.width + padding, height: image.size.height)
        let iconView = UIView(frame: frame)
        let iconImageView = UIImageView(frame: frame)
        
        iconImageView.image = image
        iconView.addSubview(iconImageView)
        
        switch side {
        case .left:
            leftViewMode = .always
            leftView = iconView
        case .right:
            rightViewMode = .always
            rightView = iconView
        }
    }
}
