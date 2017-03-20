//
//  PokemonInfoVC.swift
//  PokemonApp
//
//  Created by Dara on 2/23/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit
import AVFoundation

class PokemonInfoVC: UIViewController {
    
    @IBOutlet weak var pokemonImg: UIImageView!
    @IBOutlet weak var evolutionImg01: UIImageView!
    @IBOutlet weak var evolutionImg02: UIImageView!
    @IBOutlet weak var evolutionImg03: UIImageView!
    @IBOutlet weak var evolutionArrow01: UIImageView!
    @IBOutlet weak var evolutionArrow02: UIImageView!
    
    @IBOutlet weak var evolutionLblFocus01: UILabel!
    @IBOutlet weak var evolutionLblFocus02: UILabel!
    @IBOutlet weak var evolutionLblFocus03: UILabel!
    
    @IBOutlet weak var pokemonPokedexIdLbl: UILabel!
    @IBOutlet weak var pokemonType01Lbl: UILabel!
    @IBOutlet weak var pokemonType02Lbl: UILabel!
    @IBOutlet weak var pokemonHeight: UILabel!
    @IBOutlet weak var pokemonWeight: UILabel!
    @IBOutlet weak var pokemonSummaryTxtView: UITextView!
    
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
    
    @IBOutlet weak var downloadingIndicator: UIActivityIndicatorView!
    
    var evolutionUILblCollection: [UILabel]!
    var evolutionUIImgViewCollection: [UIImageView]!
    
    var pokemon: Pokemon! //passed in by segue, identifier "PokemonInfoVC"
    var allPokemon: [Pokemon]! //passed in by segue, identifier "PokemonInfoVC"
    var pokemonEvolution: [Pokemon]!
    
    var audioPlayer: AVAudioPlayer!
    var audioPlayerIsReadToPlay = false
    
    var isSIUnit: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        evolutionUILblCollection = [evolutionLblFocus01, evolutionLblFocus02, evolutionLblFocus03]
        evolutionUIImgViewCollection = [evolutionImg01, evolutionImg02, evolutionImg03]
        
        pokemonEvolution = allPokemon.evolution(of: pokemon)
        pokemonSummaryTxtView.alwaysBounceVertical = true
        
        isSIUnit = UserDefaults.standard.measurementDidSetToSIUnit
        
        configureTapGesture()
        updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        UserDefaults.standard.setMeasurementUnitToSIUnit(isSIUnit)
    }

    
    /*-- Functions --*/
    func configureTapGesture() {
        
        let evolutionImg01TapGesture = UITapGestureRecognizer(target: self, action: #selector(evolutionImg01Tapped))
        evolutionImg01.addGestureRecognizer(evolutionImg01TapGesture)
        evolutionImg01.isUserInteractionEnabled = true
        
        let evolutionImg02TapGesture = UITapGestureRecognizer(target: self, action: #selector(evolutionImg02Tapped))
        evolutionImg02.addGestureRecognizer(evolutionImg02TapGesture)
        evolutionImg02.isUserInteractionEnabled = true
        
        let evolutionImg03TapGesture = UITapGestureRecognizer(target: self, action: #selector(evolutionImg03Tapped))
        evolutionImg03.addGestureRecognizer(evolutionImg03TapGesture)
        evolutionImg03.isUserInteractionEnabled = true
        
        let weightTapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleMeasurmentUnit))
        let heightTapGesture = UITapGestureRecognizer(target: self, action: #selector(toggleMeasurmentUnit))
        pokemonWeight.addGestureRecognizer(weightTapGesture)
        pokemonWeight.isUserInteractionEnabled = true
        pokemonHeight.addGestureRecognizer(heightTapGesture)
        pokemonHeight.isUserInteractionEnabled = true
    }
    
    func updateUI() {
        
        setItemDefaultSetting()
        updateUIWithLocalData() //must be called before updateUIWithRemoteData()
        updateUIWithRmoteData()
        initAudioPlayer()
    }
    
    func updateUIWithLocalData() {
        
        // Update main UIImage, measurements, and types
        self.navigationItem.title = pokemon.name
        pokemonImg.image = UIImage(named: "\(pokemon.pokedexID)")
        pokemonPokedexIdLbl.text = pokemon.pokedexID.toIDOutputFormat
        
        pokemonHeight.text = pokemon.height.toHeightOutputFormat
        pokemonWeight.text = pokemon.weight.toWeightOutputFormat
        
        pokemonType01Lbl.text = self.pokemon.types.primary.toString()
        pokemonType01Lbl.backgroundColor = self.pokemon.types.primary.toUIColor()
        
        if pokemon.hasSecondType {
            pokemonType02Lbl.text = self.pokemon.types.secondary.toString()
            pokemonType02Lbl.isHidden = false
            pokemonType02Lbl.backgroundColor = self.pokemon.types.secondary.toUIColor()
        } else {
            pokemonType01Lbl.frame = CGRect(x: pokemonType01Lbl.frame.origin.x, y: pokemonType01Lbl.frame.origin.y, width: pokemonType01Lbl.frame.width * 2 + 5, height: pokemonType01Lbl.frame.height)
        }
        
        // Update evolution UIImageView
        for i in 0 ..< pokemonEvolution.count {
            // set evolution images
            evolutionUIImgViewCollection[i].isHidden = false
            evolutionUIImgViewCollection[i].image = UIImage(named: "\(pokemonEvolution[i].pokedexID)")
            
            // set focus label
            if pokemon.pokedexID == pokemonEvolution[i].pokedexID {
                evolutionUILblCollection[i].isHidden = false
            } else {
                evolutionUILblCollection[i].isHidden = true
            }
        }
        
        // Set evolution arrow
        switch pokemonEvolution.count {
        case 2:
            evolutionArrow01.isHidden = false
        case 3:
            evolutionArrow01.isHidden = false
            evolutionArrow02.isHidden = false
        default:()
        }
    }
    
    func updateUIWithRmoteData() {
        
        if pokemon.hasData {
            updateIBOutlets()
        } else {
            downloadingIndicator.startAnimating()
            self.pokemon.requestPokemonData {
                DispatchQueue.main.sync {
                    self.updateIBOutlets()
                    self.downloadingIndicator.stopAnimating()
                }
            }
        }
    }
    
    func updateIBOutlets() { // must use 'self' because this func is also used by an async func, updateUIWithLocalData()
        
        self.pokemonHpLbl.text = "\(self.pokemon.hp)"
        self.pokemonSpdLbl.text = "\(self.pokemon.speed)"
        self.pokemonAttlbl.text = "\(self.pokemon.attack)"
        self.pokemonSpAttLbl.text = "\(self.pokemon.spAttack)"
        self.pokemonDefLbl.text = "\(self.pokemon.defend)"
        self.pokemonSpDefLbl.text = "\(self.pokemon.spDefend)"
        
        self.pokemonHpPV.setProgress(self.pokemon.hp.toProgress, animated: true)
        self.pokemonSpdPV.setProgress(self.pokemon.speed.toProgress, animated: true)
        self.pokemonAttPV.setProgress(self.pokemon.attack.toProgress, animated: true)
        self.pokemonSpAttPV.setProgress(self.pokemon.spAttack.toProgress, animated: true)
        self.pokemonDefPV.setProgress(self.pokemon.defend.toProgress, animated: true)
        self.pokemonSpDefPV.setProgress(self.pokemon.spDefend.toProgress, animated: true)
        
        self.pokemonSummaryTxtView.text = self.pokemon.summary
        self.pokemonSummaryTxtView.isHidden = false
        
        if self.pokemon.hasFirstAbility {
            self.pokemonAbil01Lbl.text = self.pokemon.abilities.firstAbility
            self.pokemonAbil01Lbl.isHidden = false
        }
        
        if self.pokemon.hasSecondAbility {
            self.pokemonAbil02Lbl.text = self.pokemon.abilities.secondAbility
            self.pokemonAbil02Lbl.isHidden = false
        }
        
        if self.pokemon.hasHiddenAbility {
            self.pokemonHiddenAbilLbl.text = "\(self.pokemon.abilities.hiddenAbility) (H)"
            self.pokemonHiddenAbilLbl.isHidden = false
        }
    }
    
    func setItemDefaultSetting() {
        
        pokemonType02Lbl.isHidden = true
        pokemonAbil01Lbl.isHidden = true
        pokemonAbil02Lbl.isHidden = true
        pokemonHiddenAbilLbl.isHidden = true
        pokemonSummaryTxtView.isHidden = true
        
        if !pokemon.hasData {
            pokemonHpLbl.text = "0"
            pokemonAttlbl.text = "0"
            pokemonDefLbl.text = "0"
            pokemonSpAttLbl.text = "0"
            pokemonSpDefLbl.text = "0"
            pokemonSpdLbl.text = "0"
            
            pokemonHpPV.setProgress(DEFAULT_PROGRESS_VALUE, animated: true)
            pokemonAttPV.setProgress(DEFAULT_PROGRESS_VALUE, animated: true)
            pokemonDefPV.setProgress(DEFAULT_PROGRESS_VALUE, animated: true)
            pokemonSpAttPV.setProgress(DEFAULT_PROGRESS_VALUE, animated: true)
            pokemonSpDefPV.setProgress(DEFAULT_PROGRESS_VALUE, animated: true)
            pokemonSpdPV.setProgress(DEFAULT_PROGRESS_VALUE, animated: true)
        }
        
        pokemonType01Lbl.frame = CGRect(x: pokemonType01Lbl.frame.origin.x, y: pokemonType01Lbl.frame.origin.y, width: pokemonType02Lbl.frame.width, height: pokemonType01Lbl.frame.height)
    }
    
    func initAudioPlayer() {
        
        if let path = Bundle.main.path(forResource: "\(pokemon.pokedexID)", ofType: "m4a"), let url = URL(string: path) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayerIsReadToPlay = true
            } catch let error as NSError {
                print(error.debugDescription)
            }
        } else {
            audioPlayerIsReadToPlay = false
        }
    }
    
    
    /*-- Tap Gestures --*/
    func evolutionImg01Tapped() {
        
        if pokemon.pokedexID != pokemonEvolution[0].pokedexID {
            pokemon = pokemonEvolution[0]
            updateUI()
        }
    }
    
    func evolutionImg02Tapped() {
        
        if pokemon.pokedexID != pokemonEvolution[1].pokedexID {
            pokemon = pokemonEvolution[1]
            updateUI()
        }
    }
    
    func evolutionImg03Tapped() {
        
        if pokemon.pokedexID != pokemonEvolution[2].pokedexID {
            pokemon = pokemonEvolution[2]
            updateUI()
        }
    }
    
    func toggleMeasurmentUnit() {
        
        let isSIUnit = UserDefaults.standard.measurementDidSetToSIUnit
        UserDefaults.standard.setMeasurementUnitToSIUnit(!isSIUnit)
        UserDefaults.standard.synchronize()
        pokemonHeight.text = pokemon.height.toHeightOutputFormat
        pokemonWeight.text = pokemon.weight.toWeightOutputFormat
        
        pokemonHeight.alpha = 0
        pokemonWeight.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.pokemonHeight.alpha = 1
            self.pokemonWeight.alpha = 1
        }, completion: nil)
    }
    
    
    /*-- Buttons --*/
    @IBAction func pokeCryBtnClicked(_ sender: Any) {
        
        if audioPlayerIsReadToPlay {
            audioPlayer.prepareToPlay()
            audioPlayer.play()
        }
    }
}
