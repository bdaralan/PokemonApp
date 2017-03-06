//
//  ParsePokemonCSV.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/13/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

func ParsePokemonCSV() -> [Pokemon] {
    
    var pokemon = [Pokemon]()
    
    if let pokeCSVPath = POKEMON_CSV_PATH {
        do {
            let pokemonCSV = try String(contentsOfFile: pokeCSVPath, encoding: String.Encoding.utf8)
            var pokeLineTokens = pokemonCSV.components(separatedBy: "\n")
            
            pokeLineTokens.removeFirst() //remove the header of the csv file
            
            for i in 0 ..< pokeLineTokens.count {
                let pokeInfoArray = pokeLineTokens[i].components(separatedBy: ",")
                // pokemonInfo output is an array of:
                // ["id", "identifier", "species_id", "height", "weight", "base_experience", "order", "is_default"]
                // ["282", "gardevoir", "282", "16", "484", "233", "325", "1"]
                
                
                // the following force unwrap will work, unless csv file is corrupted
                let pokedexID = Int(pokeInfoArray[0])!
                let name = pokeInfoArray[1]
                
                var evolveFrom = 0 //zero means not evolve from any pokemon
                if pokeInfoArray[2] != "" {
                    evolveFrom = Int(pokeInfoArray[2])!
                }
                
                let evolveID = Int(pokeInfoArray[3])!
                let height = Double(pokeInfoArray[6])!
                let weight = Double(pokeInfoArray[7])!
                
                let newPokemon = Pokemon(name: name, pokedexID: pokedexID, evolveFrom: evolveFrom, evolveID: evolveID, height: height, weight: weight)
                pokemon.append(newPokemon)
            }
        } catch {
            print(error)
        }
    }
    
    return pokemon
}
