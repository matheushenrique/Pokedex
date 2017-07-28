//
//  Pokemon.swift
//  pokedex
//
//  Created by Matheus Pereiradarocha on 7/26/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import Foundation

class Pokemon {
    fileprivate var name:String!
    fileprivate var pokedexId: Int!
    
    var _name: String{
        return name
    }
    var _pokedexId: Int{
        return pokedexId
    }
    
    init(_name: String, _pokedexID: Int){
        self.name = _name
        self.pokedexId = _pokedexID
    }
    
    
}
