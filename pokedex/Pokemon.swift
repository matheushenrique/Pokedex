//
//  Pokemon.swift
//  pokedex
//
//  Created by Matheus Pereiradarocha on 7/26/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String{
        return _name
    }
    var pokedexId: Int{
        return _pokedexId
    }
    
    init(name: String, pokedexID: Int){
        self._name = name
        self._pokedexId = pokedexID
    }
    
    
}
