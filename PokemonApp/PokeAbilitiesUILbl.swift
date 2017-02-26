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
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        self.textColor = UIColor.white
        self.backgroundColor = pokeTypeColor.Unknown.withAlphaComponent(0.7)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
