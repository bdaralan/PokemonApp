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
    
    var firstAbility: String { return self._firstAbility }
    var secondAbility: String { return self._secondAbility }
    var hiddenAbility: String { return self._hiddenAbility }
    
    var hasSecondAbility: Bool {
        return _secondAbility != ""
    }
    
    var hasHiddenAbility: Bool {
        return _hiddenAbility != ""
    }
    
    init(first: String? = "", second: String? = "", hidden: String? = "") {
        self._firstAbility = first
        self._secondAbility = second
        self._hiddenAbility = hidden
    }
    
    
    func setFirstAbility(to ability: String) {
        self._firstAbility = ability.toAbilityFormat() //capitalized when call toAbilityFormat()
    }
    
    func setSecondAbility(to ability: String) {
        self._secondAbility = ability.toAbilityFormat()
    }
    
    func setHiddenAbility(to ability: String) {
        self._hiddenAbility = ability.toAbilityFormat()
    }
}
