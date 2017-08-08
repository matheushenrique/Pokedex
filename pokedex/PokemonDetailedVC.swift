//
//  PokemonDetailedVC.swift
//  pokedex
//
//  Created by Matheus Pereiradarocha on 7/30/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import UIKit

class PokemonDetailedVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(pokemon.name)
        nameLbl.text = pokemon.name.capitalized
    }

    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated:true, completion: nil)
    }

}
