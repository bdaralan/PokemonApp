//
//  EvolutionFocusUILbl.swift
//  PokemonApp
//
//  Created by Dara on 3/5/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class EvolutionFocusUILbl: UILabel {

    override func awakeFromNib() {
        self.layer.cornerRadius = 2.0
        self.clipsToBounds = true
        self.backgroundColor = COLORS.sectionTag
    }
}
