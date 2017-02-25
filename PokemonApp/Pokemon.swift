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
    private var _apiURL: String
    
    private var _hp: String?
    private var _speed: String!
    private var _attack: String?
    private var _spAttack: String?
    private var _defend: String?
    private var _spDefend: String?
    
    
    var name: String { return _name }
    var pokedexID: Int { return _pokedexID }
    var apiURL: String { return _apiURL }
    
    var speed: String { return _speed }
    
    
    init(name: String, pokedexID: Int) {
        _name = name.capitalized
        _pokedexID = pokedexID
        _apiURL = "\(API.baseURL)\(API.versionURL)\(API.pokemonURL)/\(pokedexID)"
    }
    
    /*-- Functions --*/
    func requestPokemonData(downloadCompleted: @escaping DownloadComplete) {
        if let url = URL(string: self._apiURL) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error == nil {
                    do {
                        if let data = data {
                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? SADictionary {
                                
                                if let stats = json["stats"] as? [SADictionary] {
                                    
                                    if let speed = stats[0]["base_stat"] as? Int {
                                        self._speed = "\(speed)"
                                    }
                                    
                                }
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
