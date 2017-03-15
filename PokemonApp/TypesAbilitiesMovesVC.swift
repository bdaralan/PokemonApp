//
//  TypesAbilitiesMovesVC.swift
//  PokemonApp
//
//  Created by Dara on 3/12/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class TypesAbilitiesMovesVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var selectedMenu: HomeMenu! //must be passed when perform segue
    var types = [String]()
    var abilities = [Ability]()
    var inSearchMode = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        searchBar.returnKeyType = .search
        searchBar.enablesReturnKeyAutomatically = true
        
        prepareData()
    }

    
    /*-- Protocol Functions --*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let selelctedMenu = self.selectedMenu!
        
        switch  selelctedMenu {
            
        case .Types:
            return types.count
            
        case .Abilities:
            return abilities.count
            
        default: ()
        }
        
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let selelctedMenu = self.selectedMenu!
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TypesAbilitiesMovesCell") as? TypesAbilitiesMovesCell {
        
            switch selelctedMenu {
                
            case .Types:
                cell.configureTypeCell(type: types[indexPath.row])
                return cell
                
            case .Abilities:
                abilities = ALL_ABILITY
                cell.configureAbilityCell(ability: abilities[indexPath.row].name)
                return cell
                
            default: ()
                
            }
        }
        
        return TypesAbilitiesMovesCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        
        searchBar.setShowsCancelButton(true, animated: true)
        
        let selectedMenu = self.selectedMenu!
        
        switch selectedMenu {
            
        case .Types:
            searchBar.placeholder = "Enter type"
            
        case .Abilities:
            searchBar.placeholder = "Enter name"
            
        default: ()
            
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        
        searchBar.text = ""
        searchBar.placeholder = ""
        resignSearchBar()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
        resignSearchBar()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        resignSearchBar()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        let selectedMenu = self.selectedMenu!
        
        switch selectedMenu {
        case .Types:
            if searchText == "" {
                inSearchMode = false
                types = ALL_TYPE
            } else {
                inSearchMode = true
                types = ALL_TYPE.filter({$0.range(of: searchText, options: .caseInsensitive) != nil})
            }
            
        case .Abilities:
            if searchText == "" {
                inSearchMode = false
                abilities = ALL_ABILITY
            } else {
                inSearchMode = true
                abilities = ALL_ABILITY.filter({$0.name.range(of: searchText, options: .caseInsensitive) != nil})
            }
            
        default: ()
        }
        
        tableView.reloadData()
    }
    
    /*-- Functions --*/
    func prepareData() {
        
        let selelctedMenu = self.selectedMenu!
        
        navigationItem.title = "\(selelctedMenu)"
        
        switch selelctedMenu {
            
        case .Types:
            types = ALL_TYPE
            
        case .Abilities:
            abilities = ALL_ABILITY
            
        default: ()
        }
    }
    
    func resignSearchBar() {
        
        searchBar.setShowsCancelButton(false, animated: true)
        searchBar.resignFirstResponder()
    }
}
