//
//  UserDefaults.swift
//  PokemonApp
//
//  Created by Dara on 3/19/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import Foundation


extension UserDefaults {
    
    var measurementDidSetToSIUnit: Bool {
        return UserDefaults.standard.bool(forKey: KEYS.userDefaults.measurment)
    }
    
    func setMeasurementUnitToSIUnit(_ value: Bool) {
        UserDefaults.standard.setValue(value, forKey: KEYS.userDefaults.measurment)
    }
}
