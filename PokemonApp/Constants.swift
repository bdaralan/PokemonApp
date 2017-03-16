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

let POKEMON_JSON_PATH = Bundle.main.path(forResource: "pokemon", ofType: "json")
let POKEMON_TYPES_JSON_PATH = Bundle.main.path(forResource: "types", ofType: "json")
let POKEMON_ABILITIES_JSON_PATH = Bundle.main.path(forResource: "abilities", ofType: "json")
let POKEMON_MOVES_JSON_PATH = Bundle.main.path(forResource: "moves", ofType: "json")

let DEFAULT_PROGRESS_VALUE = Float(0.01)

let API = APIData()
let COLORS = Colors()

let ALL_TYPE: [String] = populatePokeType()
let ALL_POKEMON: [Pokemon] = parsePokemonJSON()
let ALL_ABILITY: [Ability] = parseAbilityJSON()
let ALL_MOVE: [Move] = parseMoveJSON()
