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
    
    /// Convert pokemon's arbitrary weight from json to actual weight
    func toCorrectWeightOrHeight() -> Double {
        return Double(self) / 10.0
    }
}

extension Double {
    
    var toHeightOutputFormat: String {
        
        if UserDefaults.standard.measurementDidSetToSIUnit {
            return "\(self) m"
        }
        
        let (feet, inches) = meterToFeetInches(meter: self)
        
        return String(format: "%d' %02d\"", feet, inches)
    }
    
    var toWeightOutputFormat: String {
        
        if UserDefaults.standard.measurementDidSetToSIUnit {
            return "\(self) kg"
        }
        
        return "\((self * 22.046).rounded() / 10) lb"
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
