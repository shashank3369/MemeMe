//
//  ViewController.swift
//  MemeMe 1.0 The Meme Editor
//
//  Created by Kothapalli on 9/30/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var imageView: UIImageView!
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
    @IBOutlet weak var shareButton: UIBarButtonItem!
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
        shareButton.isEnabled = (imageView.image != nil)
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
    
    @IBAction func pickCamera(_ sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    @IBAction func chooseFromAlbum(_ sender: AnyObject) {
        let picker = UIImagePickerController()
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
        else {
            
        }
        self.dismiss(animated: true, completion: nil)
    }

}

