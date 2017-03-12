//
//  Constants.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/13/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

typealias DownloadComplete = () -> () //download pokemon json completed
typealias DownloadEvolutionAtIndexComplete = (_ senderIndex: Int) -> Int
typealias DictionarySA = Dictionary<String, AnyObject>
typealias DictionarySS = Dictionary<String, String>

let POKEMON_CSV_PATH = Bundle.main.path(forResource: "pokemon", ofType: "csv")
let POKEMON_TYPES_CSV_PATH = Bundle.main.path(forResource: "pokemon-types", ofType: "csv")

let DEFAULT_PROGRESS_VALUE = Float(0.01)

let API = APIData()
let COLORS = Colors()

let ALL_POKEMON = parsePokemonCSV()
