//
//  PokemonAbilities.swift
//  PokemonApp
//
//  Created by Dara on 2/25/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

class PokemonAbilities {
    
    private var _firstAblity: String!
    private var _secondAbility: String!
    private var _hiddenAbility: String!
    
    var firstAbility: String { return self.firstAbility }
    var secondAbility: String { return self.secondAbility }
    var hiddenAbility: String { return self._hiddenAbility }
    
    init() {
        
    }
    
    init(first: String, second: String? = "", hidden: String? = "") {
        self._firstAblity = first
        self._secondAbility = second
        self._hiddenAbility = hidden
    }
    
    func setFirstAbility(to ability: String) {
        self._firstAblity = ability
    }
    
    func setSecondAbility(to ability: String) {
        self._secondAbility = ability
    }
    
    func setHiddenAbility(to ability: String) {
        self._hiddenAbility = ability
    }
}
