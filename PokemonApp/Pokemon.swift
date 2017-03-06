//
//  Pokemon.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/12/17.
//  Copyright © 2017 iDara09. All rights reserved.
//
//
//  This Class contain main Class: 'Pokemon' and subclasses: 'PokeType

import Foundation

class Pokemon {
    
    private var _name: String!
    private var _pokedexID: Int!
    private var _hp: Int!
    private var _speed: Int!
    private var _attack: Int!
    private var _spAttack: Int!
    private var _defend: Int!
    private var _spDefend: Int!
    private var _height: Double!
    private var _weight: Double!
    private var _summary: String!
    private var _types: PokemonTypes!
    private var _abilities: PokemonAbilities!
    
    private var _evolveFrom: Int!
    private var _evolveID: Int!
    
    private var _pokemonURL: String!
    private var _summaryURL: String!
    private var _evolutionURL: String!
    
    
    var name: String { return _name }
    var pokedexID: Int { return _pokedexID }
    var hp: Int {return _hp }
    var speed: Int { return _speed }
    var attack: Int { return _attack }
    var spAttack: Int { return _spAttack }
    var defend: Int { return _defend }
    var spDefend: Int { return _spDefend }
    var height: Double { return _height }
    var weight: Double { return _weight }
    var summary: String { return _summary }
    var types: PokemonTypes { return _types }
    var abilities: PokemonAbilities { return self._abilities }
    var evolveFrom: Int { return _evolveFrom }
    var evolveID: Int { return _evolveID }
    
    var hasPrimaryType: Bool { return _types.primary != "" }
    var hasSecondType: Bool { return _types.secondary != "" }
    var hasFirstAbility: Bool { return _abilities.firstAbility != "" }
    var hasSecondAbility: Bool { return _abilities.secondAbility != "" }
    var hasHiddenAbility: Bool { return _abilities.hiddenAbility != "" }
    
    
    init(name: String, pokedexID: Int, evolveFrom: Int, evolveID: Int, hp: Int? = 0, speed: Int? = 0, attack: Int? = 0, defend: Int? = 0, spAttack: Int? = 0, spDefend: Int? = 0, height: Double? = 0.0, weight: Double? = 0.0, summary: String? = "") {
        _name = name.capitalized
        _pokedexID = pokedexID
        _types = PokemonTypes()
        _abilities = PokemonAbilities()
        _evolveFrom = evolveFrom
        _evolveID = evolveID
        
        _hp = hp
        _speed = speed
        _attack = attack
        _defend = defend
        _spAttack = spAttack
        _spDefend = spDefend
        _height = height?.toCorrectWeight()
        _weight = weight?.toCorrectWeight()
        _summary = ""
        
        _pokemonURL = "\(API.baseURL)\(API.versionURL)\(API.pokemonURL)/\(pokedexID)"
        _summaryURL = "\(API.baseURL)\(API.versionURL)\(API.summaryURL)/\(pokedexID)"
        _evolutionURL = "\(API.baseURL)\(API.versionURL)\(API.evolutionURL)/\(pokedexID)"
    }
    
    
    /*-- Functions --*/
    func requestPokemonData(downloadCompleted: @escaping DownloadComplete) {
        
        if let url = URL(string: self._pokemonURL) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                if error == nil {
                    do {
                        if let data = data {
                            if let pokeJson = try JSONSerialization.jsonObject(with: data, options: []) as? SADictionary {
                                
                                // Parse Stats
                                if let stats = pokeJson["stats"] as? [SADictionary] {
                                    
                                    if let speed = stats[0]["base_stat"] as? Int {
                                        self._speed = speed
                                    }
                                    
                                    if let spDefend = stats[1]["base_stat"] as? Int {
                                        self._spDefend = spDefend
                                    }
                                    
                                    if let spAttack = stats[2]["base_stat"] as? Int {
                                        self._spAttack = spAttack
                                    }
                                    
                                    if let defend = stats[3]["base_stat"] as? Int {
                                        self._defend = defend
                                    }
                                    
                                    if let attack = stats[4]["base_stat"] as? Int {
                                        self._attack = attack
                                    }
                                    
                                    if let hp = stats[5]["base_stat"] as? Int {
                                        self._hp = hp
                                    }
                                }//end parsing stats
                                
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
                                }//end parsing types
                                
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
                                }//end parsing abilities
                                
                                // Parse Summary
                                if let url = URL(string: self._summaryURL) {
                                    let data = try Data(contentsOf: url)
                                    let speciesJson = try JSONSerialization.jsonObject(with: data, options: []) as! SADictionary
                                    if let summaries = speciesJson["flavor_text_entries"] as? [SADictionary], let summary = summaries[1]["flavor_text"] as? String { //[1] is the english version
                                        self._summary = summary.replacingOccurrences(of: "\n", with: " ")
                                    }
                                }//end parsing summary
                                
                                // Parse Evolutions
                            }
                            downloadCompleted()
                        }
                    } catch let error as NSError {
                        print("\(error.debugDescription)")
                    }
                } else {
                    print(error.debugDescription)
                }
            }).resume()
        }
    }
}


/**-- Pokemon Type --**/
class PokemonTypes {
    
    private var _types = ["", ""]
    
    var primary: String { return _types[0] }
    var secondary: String { return _types[1] }
    
    
    init() { }
    init(primary: String = "", secondary: String = "") {
        _types[0] = primary.capitalized
        
        if secondary != "" {
            _types[1] = secondary.capitalized
        }
    }
    
    
    func setPrimaryType(type: String) {
        _types[0] = type.capitalized
    }
    
    func setSecondaryType(type: String) {
        _types[1] = type.capitalized
    }
}


/**-- Pokemon Ability --**/
class PokemonAbilities {
    
    private var _firstAbility: String!
    private var _secondAbility: String!
    private var _hiddenAbility: String!
    
    var firstAbility: String { return _firstAbility }
    var secondAbility: String { return _secondAbility }
    var hiddenAbility: String { return _hiddenAbility }
    
    
    init(first: String? = "", second: String? = "", hidden: String? = "") {
        _firstAbility = first
        _secondAbility = second
        _hiddenAbility = hidden
    }
    
    
    func setFirstAbility(to ability: String) {
        _firstAbility = ability.toAbilityFormat() //capitalized when call toAbilityFormat()
    }
    
    func setSecondAbility(to ability: String) {
        _secondAbility = ability.toAbilityFormat()
    }
    
    func setHiddenAbility(to ability: String) {
        _hiddenAbility = ability.toAbilityFormat()
    }
}


/**-- Extension --**/
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
