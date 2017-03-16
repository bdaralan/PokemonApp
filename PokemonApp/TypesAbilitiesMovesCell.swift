//
//  TypesAbilitiesMovesCell.swift
//  PokemonApp
//
//  Created by Dara on 3/14/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class TypesAbilitiesMovesCell: UITableViewCell {
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
    func configureTypeCell(type: String) {
        
        textLabel?.text = type
        
        let width: CGFloat = 70
        let height: CGFloat = 21
        let x: CGFloat = self.frame.width - width - 10
        let y: CGFloat = (self.frame.height - height) / 2
        
        let typeLbl = UILabel(frame: CGRect(x: x, y: y, width: width, height: height))
        typeLbl.layer.cornerRadius = 10.0
        typeLbl.clipsToBounds = true
        typeLbl.font = UIFont(name: "Gill Sans", size: 17)
        typeLbl.textColor = UIColor.white
        typeLbl.highlightedTextColor = UIColor.clear
        typeLbl.backgroundColor = type.toPokeTypeColor
        typeLbl.textAlignment = .center
        typeLbl.text = type
        
        self.addSubview(typeLbl)
    }
    
    func configureAbilityCell(ability: Ability) {
        textLabel?.text = ability.name
    }
    
    func configureMoveCell(move: Move) {
        
        textLabel?.text = move.name
        
        let width: CGFloat = 50
        let height: CGFloat = 21
        let x: CGFloat = self.frame.width - width - 10
        let y: CGFloat = (self.frame.height - height) / 2
        
        let categoryImg = UIImageView(frame: CGRect(x: x, y: y, width: width, height: height))
        categoryImg.layer.cornerRadius = 10.0
        categoryImg.clipsToBounds = true
        categoryImg.image = UIImage(named: move.category.lowercased())
        
        self.addSubview(categoryImg)
    }
}
