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
    var toIDOutputFormat: String {
        return String(format: "#%03d", self)
    }
    
    // Convert to fraction from 0.0 to 0.9
    var toProgress: Float {
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
    func toCorrectWeightOrHeight() -> Double {
        return self / 10.0
    }
    
    var toMeterOutputFormat: String {
        return "\(self)m"
    }
    
    var toKiloOutputForat: String {
        return "\(self)kg"
    }
}

extension String {
    
    var toPokeTypeColor: UIColor {
        
        switch self {
        case "\(PokeType.Bug)": return COLORS.pokemonType.Normal
        case "\(PokeType.Dark)": return COLORS.pokemonType.Bug
        case "\(PokeType.Dragon)": return COLORS.pokemonType.Dragon
        case "\(PokeType.Electric)": return COLORS.pokemonType.Electric
        case "\(PokeType.Fairy)": return COLORS.pokemonType.Fairy
        case "\(PokeType.Fighting)": return COLORS.pokemonType.Fighting
        case "\(PokeType.Fire)": return COLORS.pokemonType.Fire
        case "\(PokeType.Flying)": return COLORS.pokemonType.Flying
        case "\(PokeType.Ghost)": return COLORS.pokemonType.Ghost
        case "\(PokeType.Grass)": return COLORS.pokemonType.Grass
        case "\(PokeType.Ground)": return COLORS.pokemonType.Ground
        case "\(PokeType.Ice)": return COLORS.pokemonType.Ice
        case "\(PokeType.Normal)": return COLORS.pokemonType.Normal
        case "\(PokeType.Poison)": return COLORS.pokemonType.Poison
        case "\(PokeType.Psychic)": return COLORS.pokemonType.Psychic
        case "\(PokeType.Rock)": return COLORS.pokemonType.Rock
        case "\(PokeType.Steel)": return COLORS.pokemonType.Steel
        case "\(PokeType.Water)": return COLORS.pokemonType.Water
        default: return COLORS.pokemonType.Unknown
        }
    }
    
    var toAbilityFormat: String { // Replace '-' in ability string to space ' '
        
        return self.replacingOccurrences(of: "-", with: " ").capitalized
    }
    
    var toInt: Int {
        if let int = Int(self) {
            return int
        } else {
            return -1
        }
    }
    
    var toDouble: Double {
        if let double = Double(self) {
            return double
        } else {
            return -1.0
        }
    }
}
