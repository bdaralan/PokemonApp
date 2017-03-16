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
    private var _pokemon: Int
    private var _generation: Int
    
    init(name: String, description: String, pokemon: Int, generation: Int) {
        _name = name
        _description = description
        _pokemon = pokemon
        _generation = generation
    }
    
    var name: String { return _name }
    var description: String { return _description }
    var pokemon: Int { return _pokemon }
    var generation: Int { return _generation }
}
