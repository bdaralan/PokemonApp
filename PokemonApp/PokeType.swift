//
//  PokeTypes.swift
//  PokemonApp
//
//  Created by Dara on 2/24/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

enum PokeType: String {
    
    case Normal = "1"
    case Fighting = "2"
    case Flying = "3"
    case Poison = "4"
    case Ground = "5"
    case Rock = "6"
    case Bug = "7"
    case Ghost = "8"
    case Steel = "9"
    case Fire = "10"
    case Water = "11"
    case Grass = "12"
    case Electric = "13"
    case Psychic = "14"
    case Ice = "15"
    case Dragon = "16"
    case Dark = "17"
    case Fairy = "18"
    case Unknown = "-1"
}


extension PokeType {
    
    func toString() -> String { return "\(self)" }
    
    func toUIColor() -> UIColor { // Pokemon's type to UIColor
        
        switch self  {
            
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
        case .Unknown: return COLORS.pokemonType.Unknown
        }
    }
}
