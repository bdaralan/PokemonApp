//
//  PokedexVC.swift
//  PokemonApp
//
//  Created by Dara on 2/23/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class PokedexVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sortSC: UISegmentedControl!
    
    var pokemon = [Pokemon]()
    var allPokemon = [Pokemon]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = .search
        searchBar.enablesReturnKeyAutomatically = true
        
        allPokemon = parsePokemonCSV()
        pokemon = allPokemon
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if inSearchMode {
            searchBar.becomeFirstResponder()
            searchBar.resignFirstResponder()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonInfoVC" {
            if let sender = sender as? Pokemon, let pokemonInfoVC = segue.destination as? PokemonInfoVC {
                pokemonInfoVC.pokemon = sender
                pokemonInfoVC.allPokemon = self.allPokemon
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*-- Protocol Functions --*/
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PokemonInfoVC", sender: pokemon[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: false)
        searchBar.resignFirstResponder()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemon.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let pokeCell = tableView.dequeueReusableCell(withIdentifier: "PokeCell") as? PokeCell {
            pokeCell.configureCell(pokemon: pokemon[indexPath.row])
            
            return pokeCell
        }
        
        return PokeCell()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
        searchBar.placeholder = "Search by name or id"
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.placeholder = ""
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            inSearchMode = true
            pokemon = allPokemon.filter({ $0.name.range(of: searchText, options: .caseInsensitive) != nil || $0.pokedexID.toIDOutputFormat().range(of: searchText) != nil })
        } else {
            inSearchMode = false
            pokemon = allPokemon
        }
        
        sortSCSwitched(self)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) { //returnKeyClicked
        searchBar.resignFirstResponder()
        if searchBar.text == "" {
            searchBar.setShowsCancelButton(false, animated: true)
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
        searchBar.text = ""
        inSearchMode = false
        pokemon = allPokemon
        sortSCSwitched(self)
    }
    
    
    /*-- Button --*/
    @IBAction func sortSCSwitched(_ sender: Any) {
        switch sortSC.selectedSegmentIndex {
        case 0:
            pokemon = pokemon.sorted(by: {$0.pokedexID < $1.pokedexID})
        case 1:
            pokemon = pokemon.sorted(by: {$0.name < $1.name})
        default:
            print("sortSC should never get here")
        }
        tableView.reloadData()
    }
    
    @IBAction func settingsTapped(_ sender: Any) {
        performSegue(withIdentifier: "SettingsVC", sender: nil)
    }
}
