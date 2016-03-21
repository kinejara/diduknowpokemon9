//
//  PkmnFacts.swift
//  did you know pokemon
//
//  Created by Jorge Villa on 3/20/16.
//  Copyright © 2016 kine. All rights reserved.
//

import UIKit

class PkmnFacts: NSObject {
    var mainDictionary : NSDictionary {
        get {
            let path = NSBundle.mainBundle().pathForResource("facts", ofType: "plist")
            let dict = NSDictionary(contentsOfFile: path!)!
            return dict
        }
    }
    
    var anime : [String] {
        get {
            var animeFacts = [String]()
            
            if let arr = self.mainDictionary["anime"] as? [String] {
                for fact in arr {
                    animeFacts.append(fact)
                }
            }
        
            return animeFacts
        }
    }
}
