//
//  PokemonExtension.swift
//  PokemonApp
//
//  Created by Dara on 3/3/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

extension Array where Element: Pokemon {
    
    func evolution(of pokemon: Pokemon) -> [Pokemon] {
        
        let pokemons = self.filter( {$0.evolveID == pokemon.evolveID} ) //get pokemons of the same evolution id
        var evolutions = [Pokemon]()
        
        switch pokemons.count {
        case 1:
            evolutions = pokemons
        default:
            for i in 0 ..< pokemons.count { //grab the baby pokemon, then append
                if pokemons[i].evolveFrom == 0 {
                    evolutions.append(pokemons[i])
                }
            }
            
            //grab the rest, in order of its evolutions
            let notBabies = pokemons.filter( {$0.evolveFrom != 0} ).sorted(by: {$0.pokedexID < $1.pokedexID} )
            for notBaby in notBabies {
                evolutions.append(notBaby)
            }
        }
        
        return evolutions
    }
}
