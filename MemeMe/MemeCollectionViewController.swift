//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Kothapalli on 11/5/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {

    var memes: [Meme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(MemeCollectionViewController.addMeme))
        
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        self.collectionView?.reloadData()
    }
    
    func addMeme() {
        let loginPageView =  self.storyboard?.instantiateViewController(withIdentifier: "addMeme") as! MainVC
        present(loginPageView, animated: true, completion: nil)
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return memes.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memeCell", for: indexPath) as! MemeCollectionViewCell
        
        cell.memedImage.image = memes[indexPath.item].memeImage
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailPageView = self.storyboard?.instantiateViewController(withIdentifier: "detailView") as! DetailViewController
        detailPageView.memedImage = memes[indexPath.item].memeImage
        self.navigationController?.pushViewController(detailPageView, animated: true)
    }

}
