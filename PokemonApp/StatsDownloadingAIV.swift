//
//  StatsDownloadingAIV.swift
//  PokemonApp
//
//  Created by Dara on 3/8/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class StatsDownloadingAIV: UIActivityIndicatorView {

    override func awakeFromNib() {
        self.isHidden = true
        self.hidesWhenStopped = true
        self.color = COLORS.sectionTagText
    }
}
