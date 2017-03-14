//
//  Colors.swift
//  PokemonApp
//
//  Created by Dara on 3/3/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

/*-- Main Class --*/
class Colors {
    
    private let _pokemonType: PokeTypeColor!
    private let _navigationBar: UIColor!
    private let _sectionTagBackground: UIColor!
    private let _sectionTagText: UIColor!
    
    
    init() {
        _pokemonType = PokeTypeColor()
        _navigationBar = UIColor(red:1.00, green:0.87, blue:0.00, alpha:1.0) //FFDD00
        _sectionTagBackground = UIColor(red:0.78, green:0.87, blue:0.85, alpha:0.7) //C7DED9
        _sectionTagText = UIColor(red:0.23, green:0.30, blue:0.31, alpha:1.0) //3B4D4F
    }
    
    var pokemonType: PokeTypeColor { return _pokemonType }
    var navigationBar: UIColor { return _navigationBar }
    var sectionTagBackground: UIColor { return _sectionTagBackground }
    var sectionTagText: UIColor { return _sectionTagText }
}


/*-- Pokemon Type Color --*/
struct PokeTypeColor {
    let Normal = UIColor(red:0.66, green:0.66, blue:0.47, alpha:1.0) //A8A878
    let Fighting = UIColor(red:0.75, green:0.19, blue:0.16, alpha:1.0) //C03028
    let Flying = UIColor(red:0.66, green:0.56, blue:0.94, alpha:1.0) //A890F0
    let Poison = UIColor(red:0.63, green:0.25, blue:0.63, alpha:1.0) //A040A0
    let Ground = UIColor(red:0.88, green:0.75, blue:0.41, alpha:1.0) //E0C068
    let Rock = UIColor(red:0.72, green:0.63, blue:0.22, alpha:1.0) //B8A038
    let Bug = UIColor(red:0.66, green:0.72, blue:0.13, alpha:1.0) //A8B820
    let Ghost = UIColor(red:0.44, green:0.35, blue:0.60, alpha:1.0) //705898
    let Steel = UIColor(red:0.72, green:0.72, blue:0.82, alpha:1.0) //B8B8D0
    let Fire = UIColor(red:0.89, green:0.26, blue:0.26, alpha:1.0) //F08030
    let Water = UIColor(red:0.36, green:0.78, blue:0.90, alpha:1.0) //6890F0
    let Grass = UIColor(red:0.47, green:0.78, blue:0.31, alpha:1.0) //78C850
    let Electric = UIColor(red:0.97, green:0.82, blue:0.19, alpha:1.0) //F8D030
    let Psychic = UIColor(red:0.97, green:0.35, blue:0.53, alpha:1.0) //F85888
    let Ice = UIColor(red:0.60, green:0.85, blue:0.85, alpha:1.0) //98D8D8
    let Dragon = UIColor(red:0.44, green:0.22, blue:0.97, alpha:1.0) //7038F8
    let Dark = UIColor(red:0.44, green:0.35, blue:0.28, alpha:1.0) //705848
    let Fairy = UIColor(red:0.93, green:0.60, blue:0.67, alpha:1.0) //EE99AC
    let Unknown = UIColor(red:0.41, green:0.63, blue:0.56, alpha:1.0) //68A090
}
