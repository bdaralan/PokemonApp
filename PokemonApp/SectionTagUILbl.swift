//
//  SectionTagUILbl.swift
//  PokemonApp
//
//  Created by Dara on 2/25/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class SectionTagUILbl: UILabel {
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        self.backgroundColor = COLORS.sectionTag.withAlphaComponent(0.7)
    }
}
