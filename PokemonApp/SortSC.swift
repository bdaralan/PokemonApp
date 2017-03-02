//
//  SortSC.swift
//  PokemonApp
//
//  Created by Dara on 3/1/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class SortSC: UISegmentedControl {

    override func awakeFromNib() {
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 1.0
        self.layer.masksToBounds = true
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
