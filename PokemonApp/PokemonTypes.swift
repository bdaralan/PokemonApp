//
//  PokemonTypes.swift
//  PokemonApp
//
//  Created by Dara on 2/23/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

class PokemonTypes {
    
    private var _types = ["", ""]
    
    var primary: String {
        return _types[0]
    }
    
    var secondary: String {
        return _types[1]
    }
    
    init() {
        
    }
    
    init(primary: String, secondary: String = "") {
        self._types[0] = primary.capitalized
        
        if secondary != "" {
            self._types[1] = secondary.capitalized
        }
    }
    
    func setPrimaryType(type: String) {
        _types[0] = type.capitalized
    }
    
    func setSecondaryType(type: String) {
        _types[1] = type.capitalized
    }
}
