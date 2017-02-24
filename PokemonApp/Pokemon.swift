//
//  Pokemon.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/12/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String
    private var _pokedexID: Int
    private var _type: PokemonType?
    private var _pokemonURL: String
//    private var _weight: String
//    private var _height: String
//    private var _description: String
    
    private var _pokmeonDict = SADictionary()
    
    
    init(name: String, pokedexID: Int) {
        _name = name.capitalized
        _pokedexID = pokedexID
        _pokemonURL = "\(API.baseURL)\(API.versionURL)\(API.pokemonURL)/\(pokedexID)"
    }
    
    
    var name: String { return _name }
    var pokedexID: Int { return _pokedexID }
    var pokemonURL: String { return _pokemonURL }
    var pokemonDict: SADictionary { return _pokmeonDict }
    
    
    /*-- Functions --*/
    func requestPokemonData(downloadCompleted: @escaping DownloadComplete) {
        if let url = URL(string: self.pokemonURL) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error == nil {
                    do {
                        if let data = data {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? SADictionary {
                                self._pokmeonDict = json
                            }
                            downloadCompleted()
                        }
                    } catch let error as NSError {
                        print(error.debugDescription)
                    }
                } else {
                    print(error.debugDescription)
                }
            }).resume()
        }
    }
}
