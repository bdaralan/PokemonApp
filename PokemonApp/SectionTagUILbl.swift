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
        self.clipsToBounds = true
        self.font = UIFont(name: self.font.fontName, size: 17.0)
        self.backgroundColor = COLORS.sectionTagBackground
        self.textColor = COLORS.sectionTagText
    }
}
