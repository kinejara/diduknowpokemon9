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
    var facts : [String] = PkmnFacts().allFacts
    let cellId = "pokeCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.appBackgroundColor()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            self.facts = facts.shuffle()
            self.tableView.reloadData()
        }
    }
    
    func customizeTableView () {
        self.tableView.backgroundColor = UIColor.clearColor()
    }
    
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
    
    //MARK: Share using Activity View Controller
    func showAlertControllerWithFactText(fact : String) {
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            let image = UIImage(named: "shareImage")
            let vc = UIActivityViewController(activityItems: [fact, image!], applicationActivities: [])
            vc.popoverPresentationController?.sourceView = self.view
            
            dispatch_async(dispatch_get_main_queue()) {
                self.presentViewController(vc, animated: true, completion: nil)
            }
        }
    }
    
}
