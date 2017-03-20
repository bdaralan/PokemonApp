//
//  TypesAbilitiesMovesCell.swift
//  PokemonApp
//
//  Created by Dara on 3/14/17.
//  Copyright © 2017 iDara09. All rights reserved.
//

import UIKit

class TypesAbilitiesMovesCell: UITableViewCell {
    
    var categoryImg: UIImageView!
    
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
        
        let typeLbl = drawLable(width: 70, height: 21, fontFamily: "Gill Sans", fontSize: 17, textColor: UIColor.white, backgroundColor: type.toPokeTypeColor)
        
        self.addSubview(typeLbl)
        typeLbl.text = type
    }
    
    func configureAbilityCell(ability: Ability) {
        
        textLabel?.text = ability.name
        
        let abilityLbl = drawLable(width: 70, height: 21, fontFamily: "Gill Sans", fontSize: 17, textColor: UIColor.white, backgroundColor: UIColor.darkGray)
        
        self.addSubview(abilityLbl)
        abilityLbl.text = "Gen: \(ability.generation)"
    }
    
    func configureMoveCell(move: Move) {
                
        textLabel?.text = move.name
        
        if categoryImg == nil {
            categoryImg = UIImageView(frame: CGRect(x: self.frame.width - 60, y: self.center.y - (21 / 2), width: 50, height: 21))
            
            self.addSubview(categoryImg)
            
            categoryImg.layer.cornerRadius = categoryImg.frame.height / 2
            categoryImg.clipsToBounds = true
            categoryImg.image = UIImage(named: move.category.isEmpty ? "zmove" : move.category.lowercased())
        } else {
            categoryImg.image = UIImage(named: move.category.isEmpty ? "zmove" : move.category.lowercased())
        }
    }
    
    private func drawLable(width: CGFloat, height: CGFloat, fontFamily: String, fontSize: CGFloat, textColor: UIColor, backgroundColor: UIColor) -> UILabel {
        
        let lable = UILabel(frame: CGRect(x: self.frame.width - width - 10, y: self.center.y - (height / 2), width: width, height: height))
        lable.layer.cornerRadius = height / 2
        lable.clipsToBounds = true
        lable.font = UIFont(name: fontFamily, size: fontSize)
        lable.textColor = textColor
        lable.highlightedTextColor = UIColor.clear
        lable.backgroundColor = backgroundColor
        lable.textAlignment = .center
        
        return lable
    }
}
