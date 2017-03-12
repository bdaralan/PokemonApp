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
    
    if let pokeCSVPath = POKEMON_CSV_PATH, let pokeTypeCSVPath = POKEMON_TYPES_CSV_PATH {
        do {
            let pokemonCSV = try String(contentsOfFile: pokeCSVPath, encoding: String.Encoding.utf8)
            var pokeLineTokens = pokemonCSV.components(separatedBy: "\n")
            
            pokeLineTokens.removeFirst() //remove the header of the csv file
            
            for i in 0 ..< pokeLineTokens.count {
                let pokeInfoArray = pokeLineTokens[i].components(separatedBy: ",")
                
                // Parse pokemon basic info
                // the following force unwrap will work, unless pokemon.csv is corrupted
                let pokedexID = Int(pokeInfoArray[0])!
                let name = pokeInfoArray[1]
                
                var evolveFrom = 0 //zero means not evolve from any pokemon
                if pokeInfoArray[2] != "" {
                    evolveFrom = Int(pokeInfoArray[2])!
                }
                
                let evolveID = Int(pokeInfoArray[3])!
                let height = Double(pokeInfoArray[6])!.toCorrectWeight()
                let weight = Double(pokeInfoArray[7])!.toCorrectWeight()
                let order = Int(pokeInfoArray[9])!
                
                let newPokemon = Pokemon(name: name, pokedexID: pokedexID, evolveFrom: evolveFrom, evolveID: evolveID, order: order, height: height, weight: weight)
                pokemons.append(newPokemon)
            }
            
            // Parse pokemon types
            let pokeTypeCSVContent = try String(contentsOfFile: pokeTypeCSVPath, encoding: String.Encoding.utf8)
            var pokeTypeCSVContentByLine = pokeTypeCSVContent.components(separatedBy: "\n")
            pokeTypeCSVContentByLine.removeFirst()
            
            var index = 0
            for i in 0 ..< pokeTypeCSVContentByLine.count {
                let lineTokens = pokeTypeCSVContentByLine[i].components(separatedBy: ",")
                
                // the following force unwrap will work, unless pokemon-types.csv is corrupted
                let pokedexID = Int(lineTokens[0])!
                let type = lineTokens[1]
                let slot = lineTokens[2]
                
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
                default:
                    print("Slot must be 1 or 2, but get \(slot)")
                }
            }
        } catch {
            print(error)
        }
    }
    
    return pokemons
}
