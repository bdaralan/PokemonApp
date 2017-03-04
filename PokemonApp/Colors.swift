//
//  Colors.swift
//  PokemonApp
//
//  Created by Dara on 3/3/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class Colors {
    
    private let _pokemonType: PokeTypeColor!
    private let _navigationBar: UIColor!
    private let _sectionTag: UIColor!
    
    
    init() {
        _pokemonType = PokeTypeColor()
        _navigationBar = UIColor(red:1.00, green:0.87, blue:0.00, alpha:1.0) //FFDD00
        _sectionTag = UIColor(red:0.78, green:0.87, blue:0.85, alpha:1.0) //C7DED9
    }
    
    var pokemonType: PokeTypeColor { return _pokemonType }
    var navigationBar: UIColor { return _navigationBar }
    var sectionTag: UIColor { return _sectionTag }
}
