//
//  Pokemon.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/12/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    private var _hp: String!
    private var _speed: String!
    private var _attack: String!
    private var _spAttack: String!
    private var _defend: String!
    private var _spDefend: String!
    private var _summary: String!
    private var _types = PokemonTypes()
    private var _abilities = PokemonAbilities()
    
    private var _apiURL: String!
    
    
    var name: String { return self._name }
    var pokedexID: Int { return self._pokedexID }
    var hp: String {return self._hp }
    var speed: String { return self._speed }
    var attack: String { return self._attack }
    var spAttack: String { return self._spAttack }
    var defend: String { return self._defend }
    var spDefend: String { return self._spDefend }
    var summary: String { return self._summary }
    var types: PokemonTypes { return self._types }
    var abilities: PokemonAbilities { return self._abilities }
    
    
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
                            if let pokeJson = try JSONSerialization.jsonObject(with: data, options: []) as? SADictionary {
                                
                                // Parse Stats
                                if let stats = pokeJson["stats"] as? [SADictionary] {
                                    
                                    if let speed = stats[0]["base_stat"] as? Int {
                                        self._speed = "\(speed)"
                                    }
                                    
                                    if let spDefend = stats[1]["base_stat"] as? Int {
                                        self._spDefend = "\(spDefend)"
                                    }
                                    
                                    if let spAttack = stats[2]["base_stat"] as? Int {
                                        self._spAttack = "\(spAttack)"
                                    }
                                    
                                    if let defend = stats[3]["base_stat"] as? Int {
                                        self._defend = "\(defend)"
                                    }
                                    
                                    if let attack = stats[4]["base_stat"] as? Int {
                                        self._attack = "\(attack)"
                                    }
                                    
                                    if let hp = stats[5]["base_stat"] as? Int {
                                        self._hp = "\(hp)"
                                    }
                                    
                                }
                                
                                // Parse Types
                                if let types = pokeJson["types"] as? [SADictionary] {
                                    if types.count == 1 {
                                        if let primary = types[0]["type"] as? SADictionary {
                                            if let primary = primary["name"] as? String {
                                                self._types.setPrimaryType(type: primary)
                                            }
                                        }
                                    } else {
                                        if let primary = types[1]["type"] as? SADictionary {
                                            if let primary = primary["name"] as? String {
                                                self._types.setPrimaryType(type: primary)
                                            }
                                        }
                                        
                                        if let secondary = types[0]["type"] as? SADictionary {
                                            if let secondary = secondary["name"] as? String {
                                                self._types.setSecondaryType(type: secondary)
                                            }
                                        }
                                    }
                                }
                                
                                // Parse Abilities
                                if let abilities = pokeJson["abilities"] as? [SADictionary] {
                                    for i in 0 ..< abilities.count {
                                        if let slotNum = abilities[i]["slot"] as? Int, let ability = abilities[i]["ability"] as? SADictionary {
                                            
                                            if slotNum == 1 {
                                                if let ability = ability["name"] as? String {
                                                    self._abilities.setFirstAbility(to: ability)
                                                }
                                            } else if slotNum == 2 {
                                                if let ability = ability["name"] as? String {
                                                    self._abilities.setSecondAbility(to: ability)
                                                }
                                            } else { //slot 3 (hidden ability)
                                                if let ability = ability["name"] as? String {
                                                    self._abilities.setHiddenAbility(to: ability)
                                                }
                                            }
                                        }
                                    }
                                }
                                
                                // Parse Summary
                                if let species = pokeJson["species"] as? SADictionary {
                                    if let url = species["url"] as? String {
                                        if let url = URL(string: url) {
                                            let data = try Data(contentsOf: url)
                                            let speciesJson = try JSONSerialization.jsonObject(with: data, options: []) as! SADictionary
                                            if let summaries = speciesJson["flavor_text_entries"] as? [SADictionary], let summary = summaries[1]["flavor_text"] as? String {
                                                self._summary = summary.replacingOccurrences(of: "\n", with: " ")
                                            }
                                        }
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
