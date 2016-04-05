//
//  InterfaceController.swift
//  Did you know pokemon for apple watch Extension
//
//  Created by Jorge kinejara on 4/1/16.
//  Copyright © 2016 kine. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var factsTable : WKInterfaceTable!
    var facts : [String] = PkmnFacts().anime.shuffle()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        super.willActivate()
        self.loadTableData()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    //MARK: set up table view controller
    
    private func loadTableData() {
        self.factsTable.setNumberOfRows(self.facts.count, withRowType: "factsCell")
        
        for index in 0..<self.factsTable.numberOfRows {
            if let controller = self.factsTable.rowControllerAtIndex(index) as? FactRow {
                let formattedText : String = ("\n \(facts[index])")
                controller.factLabel.setText(formattedText)
            }
        }
    }
    
}
