//
//  File.swift
//  
//
//  Created by mohamed sliem on 15/05/2024.
//

import Foundation

import UIKit

public class LocalizationHandler: NSObject {
    
    var bundle: Bundle!
    
    public static let shared = LocalizationHandler()
    
    override init() {
        super.init()
        bundle = Bundle.main
    }
    
   public func localizedString(key: String, comment: String? = "") -> String {
        return bundle.localizedString(
            forKey: key,
            value: comment,
            table: nil
        )
    }

    public func setLanguage(languageCode: String) {
        
        if let languageDirectoryPath = Bundle.main.path(
            forResource: languageCode,
            ofType: "lproj"
        )  {
            bundle = Bundle.init(path: languageDirectoryPath)
            print(bundle)
        } else {
            resetLocalization()
        }
    }
    

    func resetLocalization() {
        bundle = Bundle.main
    }
    
}
