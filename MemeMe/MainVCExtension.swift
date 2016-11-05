//
//  MainVCExtension.swift
//  MemeMe 1.0 The Meme Editor
//
//  Created by Kothapalli on 10/1/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import Foundation
import UIKit

extension MainVC {
    
    func getKeyboardHeight(notification: NSNotification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardHeight = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        return keyboardHeight.cgRectValue.height
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func unsubscribeToKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if bottomTextField.isFirstResponder {
            view.frame.origin.y =  -getKeyboardHeight(notification: notification)
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
    
    func generateMemedImage() -> UIImage {
        toolBar.isHidden = true
        navigationBar.isHidden = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame,
                                     afterScreenUpdates: true)
        let memedImage : UIImage =
            UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        toolBar.isHidden = false
        navigationBar.isHidden = false
        return memedImage
    }
    
    func save (memedImage: UIImage) {
        let _ = Meme(topText: topTextField.text!, bottomText: bottomTextField.text!, image:
            imageView.image!, memeImage: memedImage)
    }
    
    func prepareTextField(textField: UITextField, defaultText: String){
        //setting default text
        textField.text = defaultText
        
        //setting text Attributes
        textField.defaultTextAttributes = textAttributes
        
        //setting text field Delegate
        textField.delegate = textFieldsDelegate
        
        //aligning to center
        textField.textAlignment = .center
    }
    
    func pickPictureWithSource(source: UIImagePickerControllerSourceType) {
        let picker = UIImagePickerController()
        picker.sourceType = source
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    
    func updateEditButtonEnabled() {
        editButton.isEnabled = (imageView.image != nil)
    }
}
