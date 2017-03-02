//
//  PokemonAbilities.swift
//  PokemonApp
//
//  Created by Dara on 2/25/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

class PokemonAbilities {
    
    private var _firstAbility: String!
    private var _secondAbility: String!
    private var _hiddenAbility: String!
    
    var firstAbility: String { return _firstAbility }
    var secondAbility: String { return _secondAbility }
    var hiddenAbility: String { return _hiddenAbility }
    
    
    init(first: String? = "", second: String? = "", hidden: String? = "") {
        _firstAbility = first
        _secondAbility = second
        _hiddenAbility = hidden
    }
    
    
    func setFirstAbility(to ability: String) {
        _firstAbility = ability.toAbilityFormat() //capitalized when call toAbilityFormat()
    }
    
    func setSecondAbility(to ability: String) {
        _secondAbility = ability.toAbilityFormat()
    }
    
    func setHiddenAbility(to ability: String) {
        _hiddenAbility = ability.toAbilityFormat()
    }
}
