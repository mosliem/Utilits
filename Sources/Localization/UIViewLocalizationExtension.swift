//
//  File.swift
//  
//
//  Created by mohamed sliem on 24/05/2024.
//

import UIKit

extension UIView {
    public func semanitacContent(){
        if LanguageManager.shared.getCurrentLanguage() == "ar" {
            self.semanticContentAttribute = .forceRightToLeft
        }
        else {
            self.semanticContentAttribute = .forceLeftToRight
        }
    }
}

