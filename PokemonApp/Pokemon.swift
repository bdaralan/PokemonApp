//
//  Pokemon.swift
//  PokemonAlamofire
//
//  Created by Dara on 2/12/17.
//  Copyright © 2017 iDara09. All rights reserved.
//
//
//  This Class contain main Class: 'Pokemon' and subclasses: 'PokeType'
//  Also an Extension to an array of Pokemon: [Pokemon]

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
    private var _order: Int!
    
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
    var order: Int { return _order }
    
    var hasPrimaryType: Bool { return _types.primary != .Unknown }
    var hasSecondType: Bool { return _types.secondary != .Unknown }
    var hasFirstAbility: Bool { return _abilities.firstAbility != "" }
    var hasSecondAbility: Bool { return _abilities.secondAbility != "" }
    var hasHiddenAbility: Bool { return _abilities.hiddenAbility != "" }
    var hasData: Bool {
        return _hp != 0 && _speed != 0 && _attack != 0 && _defend != 0 && _spAttack != 0 && _spDefend != 0 && _summary != ""
    }
    
    
    init(name: String, pokedexID: Int, evolveFrom: Int, evolveID: Int, order: Int, hp: Int = 0, speed: Int = 0, attack: Int = 0, defend: Int = 0, spAttack: Int = 0, spDefend: Int = 0, height: Double = 0.0, weight: Double = 0.0, summary: String = "") {
        _name = name.capitalized
        _pokedexID = pokedexID
        _types = PokemonTypes()
        _abilities = PokemonAbilities()
        _evolveFrom = evolveFrom
        _evolveID = evolveID
        _order = order
        _height = height
        _weight = weight
        
        _hp = hp
        _speed = speed
        _attack = attack
        _defend = defend
        _spAttack = spAttack
        _spDefend = spDefend
        _summary = summary
        
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
                            if let pokeJson = try JSONSerialization.jsonObject(with: data, options: []) as? DictionarySA {
                                
                                // Parse Stats
                                if let stats = pokeJson["stats"] as? [DictionarySA] {
                                    
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
                                }
                                
                                // Parse Abilities
                                if let abilities = pokeJson["abilities"] as? [DictionarySA] {
                                    
                                    for i in 0 ..< abilities.count {
                                        if let slotNum = abilities[i]["slot"] as? Int, let ability = abilities[i]["ability"] as? DictionarySS, let name = ability["name"] {
                                            switch slotNum {
                                            case 1:
                                                self._abilities.setFirstAbility(name: name)
                                            case 2:
                                                self._abilities.setSecondAbility(name: name)
                                            case 3:
                                                self._abilities.setHiddenAbility(name: name)
                                            default:
                                                print("Ability slot number is \(slotNum): requires 1, 2, or 3")
                                            }
                                        }
                                    }
                                }
                                
                                // Parse Summary
                                if let url = URL(string: self._summaryURL) {
                                    let data = try Data(contentsOf: url)
                                    let speciesJson = try JSONSerialization.jsonObject(with: data, options: []) as! DictionarySA
                                    if let summaries = speciesJson["flavor_text_entries"] as? [DictionarySA], let summary = summaries[1]["flavor_text"] as? String { //[1] is the english version
                                        self._summary = summary.replacingOccurrences(of: "\n", with: " ")
                                    }
                                }
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
    
    private var _primary: PokeType!
    private var _secondary: PokeType!
    
    var primary: PokeType { return _primary }
    var secondary: PokeType { return _secondary }
    
    
    init(primary: PokeType = .Unknown, secondary: PokeType = .Unknown) {
        _primary = primary
        _secondary = secondary
    }
    
    
    func setPrimaryType(type: PokeType) {
        _primary = type
    }
    
    func setSecondaryType(type: PokeType) {
        _secondary = type
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
    
    
    init(first: String = "", second: String = "", hidden: String = "") {
        _firstAbility = first
        _secondAbility = second
        _hiddenAbility = hidden
    }
    
    
    func setFirstAbility(name: String) {
        _firstAbility = name.toAbilityFormat() //capitalized when call toAbilityFormat()
    }
    
    func setSecondAbility(name: String) {
        _secondAbility = name.toAbilityFormat()
    }
    
    func setHiddenAbility(name: String) {
        _hiddenAbility = name.toAbilityFormat()
    }
}


/**-- Extension --**/
extension Array where Element: Pokemon {
    
    func evolution(of sender: Pokemon) -> [Pokemon] {
        
        //get all pokemons of the same evolution id, then sort them by order
        var pokemons = self.filter({$0.evolveID == sender.evolveID}).sorted(by: {$0.order < $1.order})
        var evolution = [Pokemon]()
        
        if pokemons.count <= 2 {
            evolution = pokemons
            
        } else if pokemons.count == 3 {
            if pokemons[1].evolveFrom == pokemons[2].evolveFrom { //if [1] and [2] evolve from [0]
                if sender.pokedexID == pokemons[0].pokedexID { // MARK - Possible update for better feature
                    pokemons.removeLast()
                    evolution = pokemons
                } else {
                    evolution = [pokemons[0], sender]
                }
            } else {
                evolution = pokemons
            }
            
        } else if pokemons.count == 4 {
            let baseID = pokemons[0].pokedexID
            if pokemons[1].evolveFrom == baseID, pokemons[2].evolveFrom == baseID, pokemons[3].evolveFrom == baseID { //if [1], [2], and [3] evolve from [0]
                if sender.pokedexID == pokemons[0].pokedexID {
                    evolution = [pokemons[0], pokemons[1]]
                } else {
                    evolution = [pokemons[0], sender]
                }
            } else { //else [2] and [3] evolve  from [1]
                if sender.pokedexID == pokemons[0].pokedexID || sender.pokedexID == pokemons[1].pokedexID {
                    pokemons.removeLast()
                    evolution = pokemons
                } else {
                    evolution = [pokemons[0], pokemons[1], sender]
                }
            }
            
        } else if pokemons.count == 5 { //must be [1] and [2] evolve from [0], AND [3]
            if sender.pokedexID == pokemons[3].pokedexID || sender.pokedexID == pokemons[4].pokedexID {
                evolution = [pokemons[0], pokemons[3], pokemons[4]]
            } else {
                evolution = [pokemons[0], pokemons[1], pokemons[2]]
            }
            
        } else if pokemons.count == 9 { // NOTE - Eevee evolution case, right now there is 9 eevee forms
            if sender.pokedexID == pokemons[0].pokedexID {
                evolution = [pokemons[0], pokemons[1]]
            } else {
                evolution = [pokemons[0], sender]
            }
            
        } else {
            print("Evolution count is < 1 or New Evolution Case")
        }
        
        return evolution
    }
}
