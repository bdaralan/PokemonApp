//
//  HomeTVC.swift
//  PokemonApp
//
//  Created by Dara on 3/12/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

private enum HomeMenu: String { //String = "\(indexPath.section)\(indexPath.row)"
    case Pokedex = "00"
    case Types = "01"
    case Abilites = "02"
    case Moves = "03"
    
    case Items = "10"
    case Berries = "11"
    case TMs = "12"
}

class HomeTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0: return 4
        case 1: return 3
        default: return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let selectedRow = HomeMenu(rawValue: "\(indexPath.section)\(indexPath.row)") {
            switch selectedRow {
            case .Pokedex: performSegue(withIdentifier: "PokedexVC", sender: nil)
            case .Types: performSegue(withIdentifier: "TypesAbilitiesMoves", sender: "Types")
            case .Abilites: ()
            case .Moves: ()
            case .Items: ()
            case .Berries: ()
            case .TMs: print()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "TypesAbilitiesMoves" {
            
            if let typesAbilitiesMovesTVC = segue.destination as? TypesAbilitesMovesTVC {
                
                typesAbilitiesMovesTVC.sender = "Types" 
                
            }
            // Pass the selected object to the new view controller.
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // configure cell...
    }
    */

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


    /*-- Buttons --*/
    @IBAction func settingsTapped(_ sender: Any) {
        performSegue(withIdentifier: "SettingTVC", sender: nil)
    }
}
