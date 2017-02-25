//
//  PokemonInfoVC.swift
//  PokemonApp
//
//  Created by Dara on 2/23/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class PokemonInfoVC: UIViewController {
    
    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var evolutionImg01: UIImageView!
    @IBOutlet weak var evolutionImg02: UIImageView!
    @IBOutlet weak var evolutionImg03: UIImageView!
    
    @IBOutlet weak var pokemonTypeLbl01: UILabel!
    @IBOutlet weak var pokemonTypeLbl02: UILabel!
    @IBOutlet weak var pokmeonSummaryLbl: UILabel!
    
    @IBOutlet weak var pokemonHpLbl: UILabel!
    @IBOutlet weak var pokemonSpdLbl: UILabel!
    @IBOutlet weak var pokemonAttlbl: UILabel!
    @IBOutlet weak var pokemonSpAttLbl: UILabel!
    @IBOutlet weak var pokemonDefLbl: UILabel!
    @IBOutlet weak var pokemonSpDefLbl: UILabel!
    
    var pokemon: Pokemon! //will be passed in when perform segue

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIWithLocalData()
        
        self.pokemon.requestPokemonData {
            self.updateUIWithRmoteData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUIWithLocalData() {
        self.navigationItem.title = self.pokemon.name
        self.pokemonImg.image = UIImage(named: "\(self.pokemon.pokedexID)")
    }
    
    func updateUIWithRmoteData() {
        self.pokemonHpLbl.text = pokemon.hp
        self.pokemonSpdLbl.text = pokemon.speed
        self.pokemonAttlbl.text = pokemon.attack
        self.pokemonSpAttLbl.text = pokemon.spAttack
        self.pokemonDefLbl.text = pokemon.defend
        self.pokemonSpDefLbl.text = pokemon.spDefend
        self.pokemonTypeLbl01.text = pokemon.types.primary
        self.pokemonTypeLbl02.text = pokemon.types.secondary
        
        self.pokemonTypeLbl01.backgroundColor = self.pokemon.types.primary.toUIColor()
        self.pokemonTypeLbl02.backgroundColor = self.pokemon.types.secondary.toUIColor()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
