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
            return pokeTypeColor.Normal
            
        case PokeTypes.Fighting.rawValue:
            return pokeTypeColor.Fighting
            
        case PokeTypes.Flying.rawValue:
            return pokeTypeColor.Flying
            
        case PokeTypes.Poison.rawValue:
            return pokeTypeColor.Poison
            
        case PokeTypes.Ground.rawValue:
            return pokeTypeColor.Ground
            
        case PokeTypes.Rock.rawValue:
            return pokeTypeColor.Rock
            
        case PokeTypes.Bug.rawValue:
            return pokeTypeColor.Bug
            
        case PokeTypes.Ghost.rawValue:
            return pokeTypeColor.Ghost
            
        case PokeTypes.Steel.rawValue:
            return pokeTypeColor.Steel
            
        case PokeTypes.Fire.rawValue:
            return pokeTypeColor.Fire
            
        case PokeTypes.Water.rawValue:
            return pokeTypeColor.Water
            
        case PokeTypes.Grass.rawValue:
            return pokeTypeColor.Grass
            
        case PokeTypes.Electric.rawValue:
            return pokeTypeColor.Electric
            
        case PokeTypes.Psychic.rawValue:
            return pokeTypeColor.Psychic
            
        case PokeTypes.Ice.rawValue:
            return pokeTypeColor.Ice
            
        case PokeTypes.Dragon.rawValue:
            return pokeTypeColor.Dragon
            
        case PokeTypes.Dark.rawValue:
            return pokeTypeColor.Dark
            
        case PokeTypes.Fairy.rawValue:
            return pokeTypeColor.Fairy
            
        default:
            return pokeTypeColor.Unknown
        }
    }
}
