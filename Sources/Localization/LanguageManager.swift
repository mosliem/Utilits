//
//  File.swift
//
//
//  Created by mohamed sliem on 15/05/2024.
//

import Foundation

public class LanguageManager {
    
    public static let shared = LanguageManager()
    
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
    
    //Called in App luanching
   public func prepareAppLanguage(){
        let currentLanguage = getCurrentLanguage()
        LocalizationHandler
            .shared
            .setLanguage(languageCode: currentLanguage)
        
        UserDefaults.standard.synchronize()
    }
    
    public func getCurrentLanguage() -> String {
        
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
    
    public func changeCurrentLangauge(with languageCode: String){
        UserDefaults
            .standard
            .setValue(
                languageCode,
                forKey: LanguageConstant.currentAppLanguage
            )
        
        UserDefaults.standard.synchronize() //needs restrat
        LocalizationHandler.shared.setLanguage(languageCode: languageCode)
        
    }
    
    
}
