//
//  File.swift
//  
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit

var IdentifiableObserverKey = "kIdentifiableObserverKey"

protocol observableTextField: UITextField {
    func bind(observer: @escaping (String) -> Void)
}

extension observableTextField {
    var textChanged: (String) -> Void {
        get {
            return (objc_getAssociatedObject(self, &IdentifiableObserverKey)) as! (String) -> Void
        }
        set {
            objc_setAssociatedObject(self, &IdentifiableObserverKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    public func bind(observer: @escaping (String) -> Void){
        listenToChanges()
        textChanged = observer
    }
    
}
