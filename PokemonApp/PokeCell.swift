//
//  PokeCell.swift
//  PokemonApp
//
//  Created by Dara on 2/24/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class PokeCell: UITableViewCell {

    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var pokemonNameLbl: UILabel!
    @IBOutlet weak var pokemonIDLbl: UILabel!
    
    var pokemon: Pokemon! //will be passed from PokedexVC
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(pokemon: Pokemon) {
        
        self.pokemon = pokemon
        
        self.pokemonImg.image = UIImage(named: "\(self.pokemon.pokedexID)")
        self.pokemonNameLbl.text = self.pokemon.name
        self.pokemonIDLbl.text = self.pokemon.pokedexID.outputFormat()
    }

}
