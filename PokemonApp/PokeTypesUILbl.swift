//
//  PokeTypesUILbl.swift
//  PokemonApp
//
//  Created by Dara on 2/25/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class PokeTypesUILbl: UILabel {

    override func awakeFromNib() {
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        self.textColor = UIColor.white
    }
}
