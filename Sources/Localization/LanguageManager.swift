//
//  File.swift
//
//
//  Created by mohamed sliem on 15/05/2024.
//

import Foundation

class LanguageManager {
    
    static let shared = LanguageManager()
    
    private lazy var systemLanguage = UserDefaults
        .standard
        .stringArray(
            forKey: "AppleLanguages"
        )
    
    private lazy var selectedLanguage: String? = UserDefaults
        .standard
        .value(
            forKey: LanguageConstant.currentAppLanguage
        ) as? String
    
    private init(){}
    
    func getCurrentLanguage() -> String {
        
        if let selectedLanguage {
            return selectedLanguage
        }
        else {
            return systemLanguage?
                .first?
                .components(separatedBy: "-")
                .first ?? "en"
        }
    }
    
    func changeCurrentLangauge(with languageCode: String){
        UserDefaults
            .standard
            .setValue(
                languageCode,
                forKey: LanguageConstant.currentAppLanguage
            )
        
        UserDefaults.standard.synchronize() //needs restrat
        
    }
    
    
}
