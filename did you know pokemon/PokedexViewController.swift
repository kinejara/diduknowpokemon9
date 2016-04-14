//
//  PokedexViewController.swift
//  did you know pokemon
//
//  Created by Jorge Villa on 3/2/16.
//  Copyright © 2016 kine. All rights reserved.
//

import UIKit
import GoogleMobileAds

class PokedexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, GADInterstitialDelegate, GADBannerViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var topBanner : GADBannerView!
    @IBOutlet var bottomBanner : GADBannerView!
    var interstitial : GADInterstitial!
    var facts : [String] = PkmnFacts().allFacts
    let cellId = "pokeCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = UIColor.appBackgroundColor()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellId)
        
        //self.loadTopBanner()
        //self.loadBannerBanner()
    }
    
    func loadTopBanner() {
        let request : GADRequest = GADRequest()
        //request.testDevices = ["ec71c4da41885827d9666c7fb42b8ad8"]
        self.topBanner.adUnitID = "ca-app-pub-5770021040900540/8342016118"
        self.topBanner.rootViewController = self
        self.topBanner.loadRequest(request)
    }
    
    func loadBannerBanner() {
        let request : GADRequest = GADRequest()
        //request.testDevices = ["ec71c4da41885827d9666c7fb42b8ad8"]
        self.bottomBanner.adUnitID = "ca-app-pub-5770021040900540/6479846516"
        self.bottomBanner.rootViewController = self
        self.bottomBanner.loadRequest(request)
    }
    
    //MARK: ad video delegates
    func loadInterstitial() {
        let request : GADRequest = GADRequest()
        request.testDevices = ["ec71c4da41885827d9666c7fb42b8ad8"]
        
        self.interstitial = GADInterstitial(adUnitID: "ca-app-pub-5770021040900540/3412288914")
        self.interstitial.delegate = self
        self.interstitial.loadRequest(request)
    }
    
    func interstitialDidFailToReceiveAdWithError (
        interstitial: GADInterstitial,
        error: GADRequestError) {
        print("interstitialDidFailToReceiveAdWithError: %@" + error.localizedDescription)
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
    
    //MARK: table view delegates
    
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
