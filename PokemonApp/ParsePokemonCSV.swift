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
            pokeLineTokens.removeLast() //remove the last empty element placed by Xcode
            
            for i in 0..<(pokeLineTokens.count) {
                let pokeInfoArray = pokeLineTokens[i].components(separatedBy: ",")
                // pokemonInfo output is an array of:
                // ["id", "identifier", "species_id", "height", "weight", "base_experience", "order", "is_default"]
                // ["282", "gardevoir", "282", "16", "484", "233", "325", "1"]
     
                let pokedexID = Int(pokeInfoArray[0])!
                let name = pokeInfoArray[1]
                
                let newPokemon = Pokemon(name: name, pokedexID: pokedexID)
                pokemon.append(newPokemon)
            }
        } catch {
            print(error)
        }
    }
    
    return pokemon
}
