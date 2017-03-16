//
//  ParsePokemonCSV.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/13/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation


func parseJSON(contentsOfFile path: String?) -> [DictionarySA] {
    
    do {
        if let path = path, let data = NSData(contentsOfFile: path) as? Data {
            if let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? [DictionarySA] {
                
                return jsonData
            }
        }
    } catch {
        print("Fail Parsing JSON \(error)")
    }
    
    return [DictionarySA]()
}

func parsePokemonJSON() -> [Pokemon] {
    
    var pokemons = [Pokemon]()
    let pokemonJSON = parseJSON(contentsOfFile: POKEMON_JSON_PATH) //parse basic info
    
    for pokemon in pokemonJSON {
        if let name = pokemon["identifier"] as? String,
            let pokedexID = pokemon["id"] as? Int,
            let order = pokemon["order"] as? Int,
            let height = pokemon["height"] as? Int,
            let weight = pokemon["weight"] as? Int,
            let evolveID = pokemon["evolution_chain_id"] as? Int {
            
            var evolFrom = 0
            if let evolFromNotEmpty = pokemon["evolves_from_species_id"] as? Int {
                evolFrom = evolFromNotEmpty
            }
            
            pokemons.append(Pokemon(name: name, pokedexID: pokedexID, evolveFrom: evolFrom, evolveID: evolveID, order: order, height: height.toCorrectWeightOrHeight(), weight: weight.toCorrectWeightOrHeight()))
        }
    }
    
    let typeJSON = parseJSON(contentsOfFile: POKEMON_TYPES_JSON_PATH)
    var index = 0
    for types in typeJSON {
        if let pokedexID = types["pokemon_id"] as? Int,
            let type = types["type_id"] as? Int,
            let slot = types["slot"] as? Int{
            
            if index < pokemons.count, pokemons[index].pokedexID != pokedexID {
                index += 1
            }
            
            switch slot {
            case 1:
                if let type = PokeType(rawValue: type) {
                    pokemons[index].types.setPrimaryType(type: type)
                }
            case 2:
                if let type = PokeType(rawValue: type) {
                    pokemons[index].types.setSecondaryType(type: type)
                }
            default: ()
            }
        }
    }
    
    return pokemons
}

func parseAbilityJSON() -> [Ability] {
    
    var abilities = [Ability]()
    let abilityJSON = parseJSON(contentsOfFile: POKEMON_ABILITIES_JSON_PATH)
    
    for ability in abilityJSON {
        
        if let name = ability["name"] as? String,
            let pokemon = ability["pokemon"] as? Int,
            let description = ability["description"] as? String,
            let generation = ability["generation"] as? Int {
            
            abilities.append(Ability(name: name, description: description, pokemon: pokemon, generation: generation))
        }
    }
    
    return abilities
}

func parseMoveJSON() -> [Move] {
    
    var moves = [Move]()
    let moveJSON = parseJSON(contentsOfFile: POKEMON_MOVES_JSON_PATH)
    
    for move in moveJSON {
        
        if let name = move["name"] as? String,
            let type = move["type"] as? String,
            let category = move["category"] as? String,
            let power = move["power"] as? String,
            let accuracy = move["accuracy"] as? String,
            let pp = move["pp"] as? String,
            let tm = move["tm"] as? String,
            let effect = move["effect"] as? String,
            let prob = move["prob"] as? String {
            
            moves.append(Move(name: name, type: type, category: category, power: power, accuracry: accuracy, pp: pp, tm: tm, effect: effect, prob: prob))
        }
    }
    
    return moves
}
