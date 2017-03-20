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
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        backgroundColor = COLORS.sectionTagBackground
    }
}
