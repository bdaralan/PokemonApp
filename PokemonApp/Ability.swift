//
//  Ability.swift
//  PokemonApp
//
//  Created by Dara on 3/14/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

class Ability {
    
    private var _name: String
    private var _description: String
    private var _pokemon: String
    private var _generation: String
    
    init(name: String, description: String, pokemon: String, generation: String) {
        _name = name
        _description = description
        _pokemon = pokemon
        _generation = generation
    }
    
    var name: String { return _name }
    var description: String { return _description }
    var pokemon: String { return _pokemon }
    var generation: String { return _generation }
}
