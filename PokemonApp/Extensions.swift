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
    func toIDOutputFormat() -> String {
        return String(format: "#%03d", self)
    }
    
    // Convert to fraction from 0.0 to 0.9
    func toProgress() -> Float {
        var progress: Float
        
        if self == 0 {
            progress = DEFAULT_PROGRESS_VALUE
        } else {
            progress = Float(self) / 200.0
        }
        
        return progress
    }
}

extension Double {
    
    /// Convert pokemon's arbitrary weight from csv to actual weight
    func toCorrectWeight() -> Double {
        return self / 10.0
    }
    
    func toMeterOutputFormat() -> String {
        return "\(self)m"
    }
    
    func toKiloOutputForat() -> String {
        return "\(self)kg"
    }
}

extension String {
    
    func toAbilityFormat() -> String { // Replace '-' in ability string to space ' '
        
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
    
    func removeHiddenCharacter() -> String {
        return String(self.characters.filter( { !"\r".characters.contains($0) } ))
    }
    
    func toUIColor() -> UIColor { // Take pokemon's type string and return its UIColor
        
        switch self  {
            
        case "\(PokeTypes.Normal)":
            return COLORS.pokemonType.Normal
            
        case "\(PokeTypes.Fighting)":
            return COLORS.pokemonType.Fighting
            
        case "\(PokeTypes.Flying)":
            return COLORS.pokemonType.Flying
            
        case "\(PokeTypes.Poison)":
            return COLORS.pokemonType.Poison
            
        case "\(PokeTypes.Ground)":
            return COLORS.pokemonType.Ground
            
        case "\(PokeTypes.Rock)":
            return COLORS.pokemonType.Rock
            
        case "\(PokeTypes.Bug)":
            return COLORS.pokemonType.Bug
            
        case "\(PokeTypes.Ghost)":
            return COLORS.pokemonType.Ghost
            
        case "\(PokeTypes.Steel)":
            return COLORS.pokemonType.Steel
            
        case "\(PokeTypes.Fire)":
            return COLORS.pokemonType.Fire
            
        case "\(PokeTypes.Water)":
            return COLORS.pokemonType.Water
            
        case "\(PokeTypes.Grass)":
            return COLORS.pokemonType.Grass
            
        case "\(PokeTypes.Electric)":
            return COLORS.pokemonType.Electric
            
        case "\(PokeTypes.Psychic)":
            return COLORS.pokemonType.Psychic
            
        case "\(PokeTypes.Ice)":
            return COLORS.pokemonType.Ice
            
        case "\(PokeTypes.Dragon)":
            return COLORS.pokemonType.Dragon
            
        case "\(PokeTypes.Dark)":
            return COLORS.pokemonType.Dark
            
        case "\(PokeTypes.Fairy)":
            return COLORS.pokemonType.Fairy
            
        default:
            return COLORS.pokemonType.Unknown
        }
    }
}
