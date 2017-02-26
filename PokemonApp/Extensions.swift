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
    
    func toUIColor() -> UIColor {
        let typeColor = PokemonTypeColor()
        
        switch self as PokeTypes.RawValue {
            
        case PokeTypes.Normal.rawValue:
            return typeColor.Normal
            
        case PokeTypes.Fighting.rawValue:
            return typeColor.Fighting
            
        case PokeTypes.Flying.rawValue:
            return typeColor.Flying
            
        case PokeTypes.Poison.rawValue:
            return typeColor.Poison
            
        case PokeTypes.Ground.rawValue:
            return typeColor.Ground
        
        case PokeTypes.Rock.rawValue:
            return typeColor.Rock
            
        case PokeTypes.Bug.rawValue:
            return typeColor.Bug
            
        case PokeTypes.Ghost.rawValue:
            return typeColor.Ghost
            
        case PokeTypes.Steel.rawValue:
            return typeColor.Steel
            
        case PokeTypes.Fire.rawValue:
            return typeColor.Fire
            
        case PokeTypes.Water.rawValue:
            return typeColor.Water
            
        case PokeTypes.Grass.rawValue:
            return typeColor.Grass
            
        case PokeTypes.Electric.rawValue:
            return typeColor.Electric
            
        case PokeTypes.Psychic.rawValue:
            return typeColor.Psychic
            
        case PokeTypes.Ice.rawValue:
            return typeColor.Ice
            
        case PokeTypes.Dragon.rawValue:
            return typeColor.Dragon
            
        case PokeTypes.Dark.rawValue:
            return typeColor.Dark
            
        case PokeTypes.Fairy.rawValue:
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
