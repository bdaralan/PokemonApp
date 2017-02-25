//
//  Constants.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/13/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation


let POKEMON_CSV_PATH = Bundle.main.path(forResource: "pokemon", ofType: "csv")
let POKEMON_TYPES_CSV_PATH = Bundle.main.path(forResource: "pokemon-types", ofType: "csv")
let API = APIData()

typealias DownloadComplete = () -> ()
typealias SADictionary = Dictionary<String, AnyObject>
