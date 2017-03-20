//
//  Utilities.swift
//  PokemonApp
//
//  Created by Dara on 3/15/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

func populatePokeType() -> [String] {
    
    var types = [String]()
    
    for i in 1 ... 18 {
        if let type = PokeType(rawValue: i) {
            types.append("\(type)")
        }
    }
    
    return types
}

func meterToFeetInches(meter: Double) -> (Int, Int) {
    
    let allInches: Double = meter * 39.37
    let feet = Int(allInches / 12.0)
    let inches = Int((allInches - Double(feet * 12)).rounded())
    
    return (feet, inches)
}
