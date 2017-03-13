//
//  Extension.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/13/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit


extension Int {
    
    // Add one or at most two zero (ex: 009)
    func toIDOutputFormat() -> String {
        return String(format: "#%03d", self)
    }
    
    // Convert to fraction from 0.0 to 0.9
    func toProgress() -> Float {
        var progress: Float
        
        if self == 0 {
            progress = DEFAULT_PROGRESS_VALUE
        } else {
            progress = Float(self) / 200.0
        }
        
        return progress
    }
}

extension Double {
    
    /// Convert pokemon's arbitrary weight from csv to actual weight
    func toCorrectWeightOrHeight() -> Double {
        return self / 10.0
    }
    
    func toMeterOutputFormat() -> String {
        return "\(self)m"
    }
    
    func toKiloOutputForat() -> String {
        return "\(self)kg"
    }
}

extension String {
    
    func toAbilityFormat() -> String { // Replace '-' in ability string to space ' '
        
        if self.contains("-") {
            var sep = ""
            var formated = ""
            let unformated = self.components(separatedBy: "-")
            
            if unformated.count > 1 {
                sep = " "
                for i in 0 ..< unformated.count {
                    formated += (sep + unformated[i].capitalized)
                }
            }
            
            return formated
        }
        
        return self.capitalized
    }
    
    func removeHiddenCharacter() -> String {
        return String(self.characters.filter( { !"\r".characters.contains($0) } ))
    }
    
    func toInt() -> Int {
        if let int = Int(self) {
            return int
        } else {
            return -1
        }
    }
    
    func toDouble() -> Double {
        if let double = Double(self) {
            return double
        } else {
            return -1.0
        }
    }
}
