//
//  DetailViewController.swift
//  MemeMe
//
//  Created by Kothapalli on 11/5/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var memedImageView: UIImageView!
    var memedImage: UIImage?
    var hidden = false
    override func viewDidLoad() {
        super.viewDidLoad()
        memedImageView.image = memedImage
        
        memedImageView.isUserInteractionEnabled = true
        
        // Do any additional setup after loading the view.
    }
    
}
