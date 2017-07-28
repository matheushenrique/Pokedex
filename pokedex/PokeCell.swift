//
//  PokeCell.swift
//  pokedex
//
//  Created by Matheus Pereiradarocha on 7/27/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    //dentro da cell sera preciso modificar a imagem e o label de acordo com o pokemon
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 5.0
    }
    
    func configureCell(_ pokemon: Pokemon){
        self.pokemon = pokemon
        nameLbl.text = self.pokemon._name.capitalized
        thumbImg.image = UIImage(named: "\(self.pokemon._pokedexId)")
        
    }
    
}
