//
//  ReadConstants.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/22/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

class APIData {
    
    private var _baseURL: String!
    private var _versionURL: String!
    private var _pokemonURL: String!
    
    init() {
        if let apiPath = Bundle.main.path(forResource: "pokeapi-data", ofType: "plist") {
            if let dict = NSDictionary(contentsOfFile: apiPath) {
                if let baseURL = dict["api_base_url"] as? String, let versionURL = dict["api_version_url"] as? String, let pokemonURL = dict["api_pokemon_url"] as? String {
                    
                    self._baseURL = baseURL
                    self._versionURL = versionURL
                    self._pokemonURL = pokemonURL
                    
                }
            }
        }
    }
    
    var baseURL: String {
        return _baseURL
    }
    
    var versionURL: String {
        return _versionURL
    }
    
    var pokemonURL: String {
        return _pokemonURL
    }
}
