//
//  File.swift
//  
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

extension UILabel {
    
    func setLineSpacing(_ spacing: CGFloat) {
        guard let text = self.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributedString.addAttribute(.paragraphStyle, value: style, range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
    
    func setCharacterSpacing(_ spacing: CGFloat) {
        guard let text = self.text else { return }
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(.kern, value: spacing, range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = attributedString
    }
    
    func setAttributedTextWithInsets(text: NSAttributedString, insets: UIEdgeInsets) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = self.textAlignment
        paragraphStyle.lineBreakMode = self.lineBreakMode
        paragraphStyle.firstLineHeadIndent = insets.left
        paragraphStyle.headIndent = insets.left
        paragraphStyle.tailIndent = -insets.right
        
        let attributedText = NSMutableAttributedString(attributedString: text)
        attributedText.addAttributes([.paragraphStyle: paragraphStyle], range: NSRange(location: 0, length: attributedText.length))
        
        self.attributedText = attributedText
    }
}

