//
//  TextFieldsDelegate.swift
//  MemeMe 1.0 The Meme Editor
//
//  Created by Kothapalli on 10/1/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import Foundation
import UIKit

class TextFieldsDelegate: NSObject, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        return true
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if (textField.text == "top" || textField.text == "bottom") {
            textField.text = ""
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
