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
        /*   UITapGestureRecognizer *singleFingerTap =
         [[UITapGestureRecognizer alloc] initWithTarget:self
         action:@selector(handleSingleTapinTextView:)];
         [self.pokefactLabel addGestureRecognizer:singleFingerTap];
         
         */
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TodayViewController.handleSingleTapinTextView))
        
        self.todayLabel.textAlignment = .Center
        self.todayLabel.font = UIFont(name: "pokemonGB", size: 14.0)
        self.todayLabel.userInteractionEnabled = true;
        self.todayLabel.addGestureRecognizer(tapGesture)
        
        completionHandler(NCUpdateResult.NewData)
    }
    
    func handleSingleTapinTextView() {
        
    }
    
}
