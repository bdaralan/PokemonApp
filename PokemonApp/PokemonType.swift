//
//  PokemonType.swift
//  PokemonApp
//
//  Created by Dara on 2/23/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

class PokemonType {
    
    private var _primary: PokemonTypes
    private var _secondary: PokemonTypes
    private var _primaryColor: String = "???"
    private var _secondaryColor: String = "???"
    
    var primary: PokemonTypes { return _primary }
    var secondary: PokemonTypes { return _secondary }
    var primaryColor: String { return _primaryColor }
    var secondaryColor: String { return _secondaryColor }
    
    init(primary: PokemonTypes, secondary: PokemonTypes) {
        self._primary = primary
        self._secondary = secondary
    }
    
    func assignTypeColor() {
        switch self._primary {
        default:
            self._primaryColor = ""
        }
    }
}
