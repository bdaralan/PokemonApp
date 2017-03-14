//
//  TypesAbilitesMovesTVC.swift
//  PokemonApp
//
//  Created by Dara on 3/12/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class TypesAbilitesMovesTVC: UITableViewController {
    
    var sender: Any! //must be passed when perform segue
    var pokemonTypes = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        populatePokemonTypes()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return pokemonTypes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TypesAbilitesMovesCell", for: indexPath)
        let label = createLabel(inside: cell, text: pokemonTypes[indexPath.row])
        
        cell.addSubview(label)
        cell.bringSubview(toFront: label)
        cell.textLabel?.text = pokemonTypes[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    /*-- Functions --*/
    func populatePokemonTypes() {
        
        for i in 1 ... 18 {
            if let type = PokeType(rawValue: "\(i)") {
                pokemonTypes.append(type.toString())
            }
        }
        
        pokemonTypes.sort()
    }
    
    func createLabel(inside cell: UITableViewCell, text: String) -> UILabel {
        let w = CGFloat(75)
        let h = CGFloat(21)
        let x = cell.frame.width - CGFloat(w) - CGFloat(15)
        let y = (cell.frame.height - CGFloat(h)) / CGFloat(2)
        
        let label = UILabel(frame: CGRect(x: x, y: y, width: w, height: h))
        label.backgroundColor = UIColor.black
        
        label.layer.cornerRadius = 10.0
        label.clipsToBounds = true
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.text = text
        
        return label
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
