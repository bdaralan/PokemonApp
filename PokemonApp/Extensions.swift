//
//  Extension.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/13/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit


extension Int {
    
    // Add one or at most two zero (ex: 009)
    func outputFormat() -> String {
        return String(format: "#%03d", self)
    }
    
    // Convert to fraction from 0.0 to 0.9
    func toProgress() -> Float {
        return Float(self) / 200.0
    }
}

extension String {
    
    // Replace '-' in ability string to space ' '
    func toAbilityFormat() -> String {
        
        if self.contains("-") {
            var sep = ""
            var formated = ""
            let unformated = self.components(separatedBy: "-")
            
            if unformated.count > 1 {
                sep = " "
                for i in 0 ..< unformated.count {
                    formated += (sep + unformated[i].capitalized)
                }
            }
            
            return formated
        }
        
        return self.capitalized
    }
    
    // Take pokemon type string and return its UIColor
    func toUIColor() -> UIColor {
        
        switch self  {
            
        case PokeTypes.Normal.rawValue:
            return COLORS.pokemonType.Normal
            
        case PokeTypes.Fighting.rawValue:
            return COLORS.pokemonType.Fighting
            
        case PokeTypes.Flying.rawValue:
            return COLORS.pokemonType.Flying
            
        case PokeTypes.Poison.rawValue:
            return COLORS.pokemonType.Poison
            
        case PokeTypes.Ground.rawValue:
            return COLORS.pokemonType.Ground
            
        case PokeTypes.Rock.rawValue:
            return COLORS.pokemonType.Rock
            
        case PokeTypes.Bug.rawValue:
            return COLORS.pokemonType.Bug
            
        case PokeTypes.Ghost.rawValue:
            return COLORS.pokemonType.Ghost
            
        case PokeTypes.Steel.rawValue:
            return COLORS.pokemonType.Steel
            
        case PokeTypes.Fire.rawValue:
            return COLORS.pokemonType.Fire
            
        case PokeTypes.Water.rawValue:
            return COLORS.pokemonType.Water
            
        case PokeTypes.Grass.rawValue:
            return COLORS.pokemonType.Grass
            
        case PokeTypes.Electric.rawValue:
            return COLORS.pokemonType.Electric
            
        case PokeTypes.Psychic.rawValue:
            return COLORS.pokemonType.Psychic
            
        case PokeTypes.Ice.rawValue:
            return COLORS.pokemonType.Ice
            
        case PokeTypes.Dragon.rawValue:
            return COLORS.pokemonType.Dragon
            
        case PokeTypes.Dark.rawValue:
            return COLORS.pokemonType.Dark
            
        case PokeTypes.Fairy.rawValue:
            return COLORS.pokemonType.Fairy
            
        default:
            return COLORS.pokemonType.Unknown
        }
    }
}
