//
//  TodayViewController.swift
//  DidYouKnowForPokemonWidget
//
//  Created by Jorge kinejara on 3/26/16.
//  Copyright © 2016 kine. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    @IBOutlet weak var todayLabel: UILabel!
    var facts : [String] = PkmnFacts().allFacts.shuffle()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)) {
        self.preferredContentSize = CGSizeMake(0, 65);
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TodayViewController.handleSingleTapinTextView))
        
        self.todayLabel.text = facts.first
        self.todayLabel.textAlignment = .Center
        self.todayLabel.font = UIFont(name: "pokemonGB", size: 14.0)
        self.todayLabel.userInteractionEnabled = true;
        self.todayLabel.addGestureRecognizer(tapGesture)
        
        completionHandler(NCUpdateResult.NewData)
    }
    
    func handleSingleTapinTextView() {
        let url : NSURL = NSURL(string: "home://")!
        self.extensionContext?.openURL(url, completionHandler: { (Bool) in
            
        })
    }
    
}
