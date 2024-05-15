//
//  File.swift
//  
//
//  Created by mohamed sliem on 15/05/2024.
//

import Foundation

import UIKit

class LocalizationHandler: NSObject {
    
    var bundle: Bundle!
    
    static let shared = LocalizationHandler()
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
    func localizedStringForKey(key:String, comment:String) -> String {
        return bundle.localizedString(forKey: key, value: comment, table: nil)
    }

    func setLanguage(languageCode: String) {
        
        let languageCode = LanguageManager.shared.getCurrentLanguage()
        
        if let languageDirectoryPath = Bundle.main.path(
            forResource: languageCode,
            ofType: "lproj"
        )  {
            bundle = Bundle.init(path: languageDirectoryPath)
        } else {
            resetLocalization()
        }
    }
    

    func resetLocalization() {
        bundle = Bundle.main
    }
    
}
