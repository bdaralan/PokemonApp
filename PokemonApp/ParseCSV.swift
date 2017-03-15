//
//  ParsePokemonCSV.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/13/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation


func parsePokemonCSV() -> [Pokemon] {
    
    var pokemons = [Pokemon]()
    
    let pokemonDict = CSVToDictionary(contentsOfFile: POKEMON_CSV_PATH) //parse basic info
    for pokemon in pokemonDict {
        if let name = pokemon["identifier"],
            let pokedexID = pokemon["id"]?.toInt,
            let evolFrom = pokemon["evolves_from_species_id"]?.toInt,
            let evolveID = pokemon["evolution_chain_id"]?.toInt,
            let order = pokemon["order"]?.toInt,
            let height = pokemon["height"]?.toDouble.toCorrectWeightOrHeight(),
            let weight = pokemon["weight"]?.toDouble.toCorrectWeightOrHeight() {
            
            let newPokemon = Pokemon(name: name, pokedexID: pokedexID, evolveFrom: evolFrom, evolveID: evolveID, order: order,  height: height, weight: weight)
            
            pokemons.append(newPokemon)
        }
    }
    
    let typeDict = CSVToDictionary(contentsOfFile: POKEMON_TYPES_CSV_PATH) //parse types
    var index = 0
    for types in typeDict {
        if let pokedexID = types["pokemon_id"]?.toInt, let type = types["type_id"], let slot = types["slot"] {
            
            if index < pokemons.count, pokemons[index].pokedexID != pokedexID {
                index += 1
            }
            
            switch slot {
            case "1":
                if let type = PokeType(rawValue: type) {
                    pokemons[index].types.setPrimaryType(type: type)
                }
            case "2":
                if let type = PokeType(rawValue: type) {
                    pokemons[index].types.setSecondaryType(type: type)
                }
            default: ()
            }
        }
    }
    
    return pokemons
}

func parseAbilitiesCSV() -> [Ability] {
    
    var abilities = [Ability]()
    
    let abilityDict = CSVToDictionary(contentsOfFile: POKEMON_ABILITIES_CSV_PATH)
    for ability in abilityDict {
       
        if let name = ability["name"], let description = ability["description"], let pokemon = ability["pokemon"], let generation = ability["generation"] {
            
            abilities.append(Ability(name: name, description: description, pokemon: pokemon, generation: generation))
        }
    }
    
    return abilities
}

func parseItemCSV() {
    
}
