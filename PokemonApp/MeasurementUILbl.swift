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
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 10.0
        self.layer.masksToBounds = true
        self.backgroundColor = UIColor.white
    }

}
