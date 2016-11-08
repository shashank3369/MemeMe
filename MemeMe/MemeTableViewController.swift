//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Kothapalli on 11/5/16.
//  Copyright © 2016 Kothapalli. All rights reserved.
//

import UIKit

class MemeTableViewController: UITableViewController {

    var memes: [Meme] {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(MemeTableViewController.addMeme))
    }

    func addMeme() {
        let addPageView =  self.storyboard?.instantiateViewController(withIdentifier: "addMeme") as! MainVC
        present(addPageView, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  memes.count
    }

    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memeIdentifier", for: indexPath) as! MemeTableViewCell

        // Configure the cell...

        cell.memeImage.image = memes[indexPath.row].memeImage
        cell.memeLabel.text = "\(memes[indexPath.row].topText) \(memes[indexPath.row].bottomText)"
        return cell
    }
 

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailPageView = self.storyboard?.instantiateViewController(withIdentifier: "detailView") as! DetailViewController
        detailPageView.memedImage = memes[indexPath.row].memeImage
        self.navigationController?.pushViewController(detailPageView, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        switch editingStyle {
            case .delete:
                let delegate = UIApplication.shared.delegate as! AppDelegate
                delegate.memes.remove(at: indexPath.row)
            
                tableView.reloadData()
            default:
                break
        }
        
    }
}
