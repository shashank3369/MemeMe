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
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    
    @IBAction func shareMeme(_ sender: AnyObject) {
        let generatedImage = generateMemedImage()
        let activityViewController = UIActivityViewController(activityItems: [generatedImage], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
        activityViewController.completionWithItemsHandler = {(_, completed, _, _) in
            if completed {
                self.save(memedImage: generatedImage)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    let textAttributes = [
        NSStrokeColorAttributeName: UIColor.black,
        NSForegroundColorAttributeName: UIColor.white,
        NSFontAttributeName: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSStrokeWidthAttributeName : -3.0
        
    ] as [String : Any]
    
    let textFieldsDelegate = TextFieldsDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        prepareTextField(textField: bottomTextField, defaultText: "BOTTOM")
        prepareTextField(textField: topTextField, defaultText: "TOP")
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        shareButton.isEnabled = (imageView.image != nil)
        subscribeToKeyboardNotifications()
    }
    
    @IBAction func cancel(_ sender: AnyObject) {
        imageView.image = nil
        prepareTextField(textField: bottomTextField, defaultText: "BOTTOM")
        prepareTextField(textField: topTextField, defaultText: "TOP")
        shareButton.isEnabled = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        unsubscribeToKeyboardNotifications()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func pickCamera(_ sender: AnyObject) {
        pickPictureWithSource(source: UIImagePickerControllerSourceType.camera)
    }
    @IBAction func chooseFromAlbum(_ sender: AnyObject) {
        pickPictureWithSource(source: UIImagePickerControllerSourceType.photoLibrary)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
        else {
            
        }
        dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}

