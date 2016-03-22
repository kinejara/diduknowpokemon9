//
//  PokedexViewController.swift
//  did you know pokemon
//
//  Created by Jorge Villa on 3/2/16.
//  Copyright © 2016 kine. All rights reserved.
//

import UIKit

class PokedexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let facts : [String] = PkmnFacts().allFacts
    let cellId = "pokeCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.appBackgroundColor()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
    }
    
    func customizeTableView () {
        self.tableView.backgroundColor = UIColor.clearColor()
    }
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.facts.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier(cellId)! as UITableViewCell
        cell.textLabel?.font = UIFont(name: "PokemonGB", size: 14.0)
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.textAlignment = NSTextAlignment.Center
        cell.textLabel?.text = "\n" + self.facts[indexPath.row] + "\n"
        
        cell.contentView.backgroundColor = UIColor.clearColor()
        cell.backgroundColor = UIColor.clearColor()
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        self.showAlertControllerWithFactText("\(self.facts[indexPath.row])")
    }
    
    func showAlertControllerWithFactText(fact : String) {
        /*
        let alertController = UIAlertController(title: "Hey AppCoda", message: "What do you want to do?", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(defaultAction)
        
        presentViewController(alertController, animated: true, completion: nil)
        */
        let alertController = UIAlertController(title: "", message: fact, preferredStyle: .ActionSheet)
        let defaultAction = UIAlertAction(title: "Cancel", style: .Destructive, handler: nil)
        let shareFaceBook = UIAlertAction(title: "Facebook", style: .Default, handler: nil)
        let smsShare = UIAlertAction(title: "SMS", style: .Default, handler: nil)
        
        alertController.addAction(shareFaceBook)
        alertController.addAction(defaultAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
}
