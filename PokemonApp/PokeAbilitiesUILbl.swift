//
//  PokeAbilitiesUILbl.swift
//  PokemonApp
//
//  Created by Dara on 2/25/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class PokeAbilitiesUILbl: UILabel {

    override func awakeFromNib() {
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
        self.textColor = UIColor.black
        self.backgroundColor = COLORS.sectionTagBackground.withAlphaComponent(0.4)
    }
}
