//
//  TypesAbilitiesMovesTVC.swift
//  PokemonApp
//
//  Created by Dara on 3/12/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class TypesAbilitiesMovesTVC: UITableViewController {
    
    var homeMenu: HomeMenu! //must be passed when perform segue
    var pokemonTypes = [String]()
    var pokemonAbilities = [Ability]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let homeMenu = homeMenu {
            switch  homeMenu {
                
            case .Types:
                return pokemonTypes.count
                
            case .Abilities:
                pokemonAbilities = parseAbilitiesCSV()
                return pokemonAbilities.count
                
            default: ()
            }
        }
        
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TypesAbilitiesMovesCell") as? TypesAbilitiesMovesCell, let homeMenu = homeMenu {
        
            switch homeMenu {
                
            case .Types:
                cell.configureTypeCell(type: pokemonTypes[indexPath.row])
                return cell
                
            case .Abilities:
                cell.configureAbilityCell(ability: pokemonAbilities[indexPath.row].name)
                return cell
                
            default: ()
                
            }
            
        }
        
        return TypesAbilitiesMovesCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    /*-- Functions --*/
    func prepareData() {
        
        if let homeMenu = homeMenu {
            switch homeMenu {
                
            case .Types:
                navigationItem.title = "\(homeMenu)"
                populatePokemonTypes()
                
            default: ()
                
            }
        }
    }
    
    func populatePokemonTypes() {
        
        for i in 1 ... 18 {
            if let type = PokeType(rawValue: "\(i)") {
                pokemonTypes.append(type.toString())
            }
        }
        
        pokemonTypes.sort()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
