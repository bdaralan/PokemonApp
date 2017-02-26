//
//  Extension.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/13/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

extension Int {
    
    func outputFormat() -> String {
        return String(format: "#%03d", self)
    }
}

extension String {
    
    func toUIColor() -> UIColor {
        let typeColor = PokemonTypeColor()
        
        switch self as PokemonTypes.RawValue {
            
        case PokemonTypes.Normal.rawValue:
            return typeColor.Normal
            
        case PokemonTypes.Fighting.rawValue:
            return typeColor.Fighting
            
        case PokemonTypes.Flying.rawValue:
            return typeColor.Flying
            
        case PokemonTypes.Poison.rawValue:
            return typeColor.Poison
            
        case PokemonTypes.Ground.rawValue:
            return typeColor.Ground
        
        case PokemonTypes.Rock.rawValue:
            return typeColor.Rock
            
        case PokemonTypes.Bug.rawValue:
            return typeColor.Bug
            
        case PokemonTypes.Ghost.rawValue:
            return typeColor.Ghost
            
        case PokemonTypes.Steel.rawValue:
            return typeColor.Steel
            
        case PokemonTypes.Fire.rawValue:
            return typeColor.Fire
            
        case PokemonTypes.Water.rawValue:
            return typeColor.Water
            
        case PokemonTypes.Grass.rawValue:
            return typeColor.Grass
            
        case PokemonTypes.Electric.rawValue:
            return typeColor.Electric
            
        case PokemonTypes.Psychic.rawValue:
            return typeColor.Psychic
            
        case PokemonTypes.Ice.rawValue:
            return typeColor.Ice
            
        case PokemonTypes.Dragon.rawValue:
            return typeColor.Dragon
            
        case PokemonTypes.Dark.rawValue:
            return typeColor.Dark
            
        case PokemonTypes.Fairy.rawValue:
            return typeColor.Fairy
            
        default:
            return typeColor.Unknown
        }
    }
}

extension UILabel {
    
    func toPokeTypeLbl() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
}
