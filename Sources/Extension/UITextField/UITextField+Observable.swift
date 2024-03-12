//
//  UITextField+Observable.swift
//
//
//  Created by mohamed sliem on 12/03/2024.
//

import UIKit



extension UITextField: observableTextField {
    func listenToChanges(){
        self.addTarget(self, action: #selector(editingChanged), for: .editingChanged)
    }
    
    @objc func editingChanged(textField: UITextField) {
        if let text = textField.text {
            textChanged(text)
        }
    }
    
}
