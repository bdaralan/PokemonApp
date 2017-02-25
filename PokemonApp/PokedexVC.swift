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
    
    var pokemon = [Pokemon]()
    var allPokemon = [Pokemon]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = .done
        searchBar.enablesReturnKeyAutomatically = false
        
        allPokemon = ParsePokemonCSV()
        pokemon = allPokemon
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PokemonInfoVC" {
            if let sender = sender as? Pokemon, let pokemonInfoVC = segue.destination as? PokemonInfoVC {
                pokemonInfoVC.pokemon = sender
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "PokemonInfoVC", sender: pokemon[indexPath.row])
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
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != "" {
            inSearchMode = true
            pokemon = allPokemon.filter({ $0.name.range(of: searchText) != nil })
        } else {
            inSearchMode = false
            pokemon = allPokemon
        }
        
        tableView.reloadData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
