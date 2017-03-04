//
//  NavBarUIC.swift
//  PokemonApp
//
//  Created by Dara on 2/27/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class NavBarUIC: UINavigationController {
    
    override func awakeFromNib() {
        self.navigationBar.barTintColor = COLORS.navigationBar
    }
}
