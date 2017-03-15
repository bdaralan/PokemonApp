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
        if let type = PokeType(rawValue: "\(i)") {
            types.append("\(type)")
        }
    }
    
    return types
}
