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
    
    var primary: PokemonTypes { return _primary }
    var secondary: PokemonTypes { return _secondary }
    
    init(primary: PokemonTypes, secondary: PokemonTypes) {
        self._primary = primary
        self._secondary = secondary
    }
}
