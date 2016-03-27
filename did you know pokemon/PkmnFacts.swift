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
            var fileName = "facts"
            let pre = NSLocale.preferredLanguages()[0]
            
            if pre.containsString("es") {
                fileName = "hechos"
            }
            
            let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "plist")
            let dict = NSDictionary(contentsOfFile: path!)!
            return dict
        }
    }
    
    var allFacts : [String] {
        get {
            var allFacts = [String]()
            
            allFacts.appendContentsOf(self.anime)
            allFacts.appendContentsOf(self.firstGen)
            allFacts.appendContentsOf(self.secondGen)
            allFacts.appendContentsOf(self.thirdGen)
            allFacts.appendContentsOf(self.fourthGen)
            allFacts.appendContentsOf(self.fiveGen)
            allFacts.appendContentsOf(self.sixGen)
            
            return allFacts
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
    
    var firstGen : [String] {
        get {
            var firstGenFacts = [String]()
            
            if let arr = self.mainDictionary["firstGen"] as? [String] {
                for fact in arr {
                    firstGenFacts.append(fact)
                }
            }
            
            return firstGenFacts
        }
    }
    
    var secondGen : [String] {
        get {
            var secondGenFacts = [String]()
            
            if let arr = self.mainDictionary["secondGen"] as? [String] {
                for fact in arr {
                    secondGenFacts.append(fact)
                }
            }
            
            return secondGenFacts
        }
    }
    
    var thirdGen : [String] {
        get {
            var thirdGenFacts = [String]()
            
            if let arr = self.mainDictionary["thirdGen"] as? [String] {
                for fact in arr {
                    thirdGenFacts.append(fact)
                }
            }
            
            return thirdGenFacts
        }
    }
    
    var fourthGen : [String] {
        get {
            var fourthGenFacts = [String]()
            
            if let arr = self.mainDictionary["fourthGen"] as? [String] {
                for fact in arr {
                    fourthGenFacts.append(fact)
                }
            }
            
            return fourthGenFacts
        }
    }
    
    var fiveGen : [String] {
        get {
            var fiveGenFacts = [String]()
            
            if let arr = self.mainDictionary["fiveGen"] as? [String] {
                for fact in arr {
                    fiveGenFacts.append(fact)
                }
            }
            
            return fiveGenFacts
        }
    }
    
    var sixGen : [String] {
        get {
            var sixGenFacts = [String]()
            
            if let arr = self.mainDictionary["sixGen"] as? [String] {
                for fact in arr {
                    sixGenFacts.append(fact)
                }
            }
            
            return sixGenFacts
        }
    }
}

