//
//  Move.swift
//  PokemonApp
//
//  Created by Dara on 3/15/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation


class Move {
    
    private var _name: String
    private var _type: String
    private var _category: String
    private var _power: String
    private var _accuracy: String
    private var _pp: String
    private var _tm: String
    private var _effect: String
    private var _prob: String
    
    init(name: String, type: String, category: String, power: String, accuracry: String, pp: String, tm: String, effect: String, prob: String) {
        
        _name = name
        _type = type
        _category = category
        _power = power
        _accuracy = accuracry
        _pp = pp
        _tm = tm
        _effect = effect
        _prob = prob
    }
    
    var name: String { return _name }
    var type: String { return _type }
    var category: String { return _category }
    var power: String { return _power }
    var accuracy: String { return _accuracy }
    var pp: String { return _pp }
    var tm: String { return _tm }
    var effect: String { return _effect }
    var prob: String { return _prob }
}
