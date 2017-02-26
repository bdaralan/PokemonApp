//
//  PokemonTypeColor.swift
//  PokemonApp
//
//  Created by Dara on 2/24/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class PokeTypeColor {
    
    let Normal,
    Fighting,
    Flying,
    Poison,
    Ground,
    Rock,
    Bug,
    Ghost,
    Steel,
    Fire,
    Water,
    Grass,
    Electric,
    Psychic,
    Ice,
    Dragon,
    Dark,
    Fairy,
    Unknown: UIColor
    
    init() {
        Normal = UIColor(red:0.66, green:0.66, blue:0.47, alpha:1.0) //A8A878
        Fighting = UIColor(red:0.75, green:0.19, blue:0.16, alpha:1.0) //C03028
        Flying = UIColor(red:0.66, green:0.56, blue:0.94, alpha:1.0) //A890F0
        Poison = UIColor(red:0.63, green:0.25, blue:0.63, alpha:1.0) //A040A0
        Ground = UIColor(red:0.88, green:0.75, blue:0.41, alpha:1.0) //E0C068
        Rock = UIColor(red:0.72, green:0.63, blue:0.22, alpha:1.0) //B8A038
        Bug = UIColor(red:0.66, green:0.72, blue:0.13, alpha:1.0) //A8B820
        Ghost = UIColor(red:0.44, green:0.35, blue:0.60, alpha:1.0) //705898
        Steel = UIColor(red:0.72, green:0.72, blue:0.82, alpha:1.0) //B8B8D0
        Fire = UIColor(red:0.89, green:0.26, blue:0.26, alpha:1.0) //F08030
        Water = UIColor(red:0.36, green:0.78, blue:0.90, alpha:1.0) //6890F0
        Grass = UIColor(red:0.47, green:0.78, blue:0.31, alpha:1.0) //78C850
        Electric = UIColor(red:0.97, green:0.82, blue:0.19, alpha:1.0) //F8D030
        Psychic = UIColor(red:0.97, green:0.35, blue:0.53, alpha:1.0) //F85888
        Ice = UIColor(red:0.60, green:0.85, blue:0.85, alpha:1.0) //98D8D8
        Dragon = UIColor(red:0.44, green:0.22, blue:0.97, alpha:1.0) //7038F8
        Dark = UIColor(red:0.44, green:0.35, blue:0.28, alpha:1.0) //705848
        Fairy = UIColor(red:0.93, green:0.60, blue:0.67, alpha:1.0) //EE99AC
        Unknown = UIColor(red:0.41, green:0.63, blue:0.56, alpha:1.0) //68A090
    }
}
