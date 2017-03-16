//
//  PokeTypes.swift
//  PokemonApp
//
//  Created by Dara on 2/24/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

enum PokeType: Int {
    
    case Unknown = 0
    case Normal
    case Fighting
    case Flying
    case Poison
    case Ground
    case Rock
    case Bug
    case Ghost
    case Steel
    case Fire
    case Water
    case Grass
    case Electric
    case Psychic
    case Ice
    case Dragon
    case Dark
    case Fairy
}


extension PokeType {
    
    func toString() -> String { return "\(self)" }
    
    func toUIColor() -> UIColor { // Pokemon's type to UIColor
        
        switch self  {
            
        case .Unknown: return COLORS.pokemonType.Unknown
        case .Normal: return COLORS.pokemonType.Normal
        case .Fighting: return COLORS.pokemonType.Fighting
        case .Flying: return COLORS.pokemonType.Flying
        case .Poison: return COLORS.pokemonType.Poison
        case .Ground: return COLORS.pokemonType.Ground
        case .Rock: return COLORS.pokemonType.Rock
        case .Bug: return COLORS.pokemonType.Bug
        case .Ghost: return COLORS.pokemonType.Ghost
        case .Steel: return COLORS.pokemonType.Steel
        case .Fire: return COLORS.pokemonType.Fire
        case .Water: return COLORS.pokemonType.Water
        case .Grass: return COLORS.pokemonType.Grass
        case .Electric: return COLORS.pokemonType.Electric
        case .Psychic: return COLORS.pokemonType.Psychic
        case .Ice: return COLORS.pokemonType.Ice
        case .Dragon: return COLORS.pokemonType.Dragon
        case .Dark: return COLORS.pokemonType.Dark
        case .Fairy: return COLORS.pokemonType.Fairy
        }
    }
}
