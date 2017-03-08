//
//  MeasurementUILbl.swift
//  PokemonApp
//
//  Created by Dara on 3/5/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class MeasurementUILbl: UILabel {

    override func awakeFromNib() {
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        self.textColor = UIColor.black
        self.backgroundColor = COLORS.sectionTagBackground.withAlphaComponent(0.4)
    }

}
