//
//  ViewController.swift
//  MemeMe 1.0 The Meme Editor
//
//  Created by Kothapalli on 9/30/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    let textAttributes = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : 3.0
    ] as [String : Any]
    
    let textFieldsDelegate = TextFieldsDelegate()
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        //setting properties of text field
        
        //aligning text
        bottomTextField.textAlignment = .center
        topTextField.textAlignment = .center
        
        //setting default text
        bottomTextField.text = "BOTTOM"
        topTextField.text = "TOP"
        
        //setting text Attributes
        bottomTextField.defaultTextAttributes = textAttributes
        topTextField.defaultTextAttributes = textAttributes
        
        //setting text field Delegate
        topTextField.delegate = textFieldsDelegate
        bottomTextField.delegate = textFieldsDelegate
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unsubscribeToKeyboardNotifications()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
    }
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

}

