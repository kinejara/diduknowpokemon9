//
//  GlanceController.swift
//  Did you know pokemon for apple watch Extension
//
//  Created by Jorge kinejara on 4/1/16.
//  Copyright © 2016 kine. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {

    var facts : [String] = PkmnFacts().anime.shuffle()
    @IBOutlet weak var mainLabel: WKInterfaceLabel!
    @IBOutlet weak var headerLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        self.customizeHeaderLabel()
        self.customizeMainLabel()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func customizeHeaderLabel() {
        let myAttribute = [ NSFontAttributeName: UIFont(name: "PokemonGB", size: 14.0)! ]
        let myString = NSMutableAttributedString(string: "Poke-Fact", attributes: myAttribute )
        
        self.headerLabel.setAttributedText(myString)
    }
    
    func customizeMainLabel() {
        let fact = self.facts.first
        let myAttribute = [ NSFontAttributeName: UIFont(name: "PokemonGB", size: 12.0)! ]
        let myString = NSMutableAttributedString(string: fact!, attributes: myAttribute )
        
        self.mainLabel.setAttributedText(myString)
    }
}
