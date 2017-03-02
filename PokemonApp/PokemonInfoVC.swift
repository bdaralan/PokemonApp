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
    @IBOutlet weak var pokemonSummaryLbl: UILabel!
    
    @IBOutlet weak var pokemonHpLbl: UILabel!
    @IBOutlet weak var pokemonSpdLbl: UILabel!
    @IBOutlet weak var pokemonAttlbl: UILabel!
    @IBOutlet weak var pokemonSpAttLbl: UILabel!
    @IBOutlet weak var pokemonDefLbl: UILabel!
    @IBOutlet weak var pokemonSpDefLbl: UILabel!
    
    @IBOutlet weak var pokemonAbil01Lbl: UILabel!
    @IBOutlet weak var pokemonAbil02Lbl: UILabel!
    @IBOutlet weak var pokemonHiddenAbilLbl: UILabel!
    
    @IBOutlet weak var pokemonHpPV: UIProgressView!
    @IBOutlet weak var pokemonSpdPV: UIProgressView!
    @IBOutlet weak var pokemonAttPV: UIProgressView!
    @IBOutlet weak var pokemonSpAttPV: UIProgressView!
    @IBOutlet weak var pokemonDefPV: UIProgressView!
    @IBOutlet weak var pokemonSpDefPV: UIProgressView!
    
    
    var pokemon: Pokemon! //will be passed in when perform segue

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUIWithLocalData()
        updateUIWithRmoteData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateUIWithLocalData() {
        self.navigationItem.title = pokemon.name
        pokemonImg.image = UIImage(named: "\(pokemon.pokedexID)")
    }
    
    func updateUIWithRmoteData() {
        self.pokemon.requestPokemonData {
            DispatchQueue.main.async {
                // REMINDER: do not fully understand 'DispatchQueue.main.async' yet, must learn about it later
                self.pokemonHpLbl.text = "\(self.pokemon.hp)"
                self.pokemonSpdLbl.text = "\(self.pokemon.speed)"
                self.pokemonAttlbl.text = "\(self.pokemon.attack)"
                self.pokemonSpAttLbl.text = "\(self.pokemon.spAttack)"
                self.pokemonDefLbl.text = "\(self.pokemon.defend)"
                self.pokemonSpDefLbl.text = "\(self.pokemon.spDefend)"
                
                self.pokemonHpPV.progress = self.pokemon.hp.toProgress()
                self.pokemonSpdPV.progress = self.pokemon.speed.toProgress()
                self.pokemonAttPV.progress = self.pokemon.attack.toProgress()
                self.pokemonSpAttPV.progress = self.pokemon.spAttack.toProgress()
                self.pokemonDefPV.progress = self.pokemon.defend.toProgress()
                self.pokemonSpDefPV.progress = self.pokemon.spDefend.toProgress()
                
                self.pokemonSummaryLbl.text = self.pokemon.summary
                self.pokemonSummaryLbl.isHidden = false
                
                self.pokemonTypeLbl01.text = self.pokemon.types.primary
                self.pokemonTypeLbl01.isHidden = false
                if self.pokemon.types.secondary != "" {
                    self.pokemonTypeLbl02.text = self.pokemon.types.secondary
                    self.pokemonTypeLbl02.isHidden = false
                }
                
                self.pokemonTypeLbl01.backgroundColor = self.pokemon.types.primary.toUIColor()
                self.pokemonTypeLbl02.backgroundColor = self.pokemon.types.secondary.toUIColor()
                
                self.pokemonAbil01Lbl.text = self.pokemon.abilities.firstAbility
                self.pokemonAbil01Lbl.isHidden = false
                if self.pokemon.hasSecondAbility {
                    self.pokemonAbil02Lbl.text = self.pokemon.abilities.secondAbility
                    self.pokemonAbil02Lbl.isHidden = false
                }
                if self.pokemon.hasHiddenAbility {
                    self.pokemonHiddenAbilLbl.text = "\(self.pokemon.abilities.hiddenAbility) (H)"
                    self.pokemonHiddenAbilLbl.isHidden = false
                }
            }
        }
    }
}
