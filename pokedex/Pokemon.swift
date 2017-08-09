//
//  Pokemon.swift
//  pokedex
//
//  Created by Matheus Pereiradarocha on 7/26/17.
//  Copyright © 2017 Matheus Pereiradarocha. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutioTxt: String!
    private var _nextEvolutionName: String!
    private var _nextEvolutionId: String!
    private var _nextEvolutionLvl: String!
    private var _pokemonURL: String!
    
    
    
    
    var nextEvolutionLvl: String{
        if _nextEvolutionLvl == nil{
            _nextEvolutionLvl = ""
        }
        return _nextEvolutionLvl
    }
    var nextEvolutionId: String{
        if _nextEvolutionId == nil{
            _nextEvolutionId = ""
        }
        return _nextEvolutionId
    }
    var nextEvolutionName: String{
        if _nextEvolutionName == nil{
            _nextEvolutioTxt = ""
        }
        return _nextEvolutionName
    }

    var nextEvolutionTxt: String{
        if _nextEvolutioTxt == nil{
            _nextEvolutioTxt = ""
        }
        return _nextEvolutioTxt
    }
    var attack: String{
        if _attack == nil{
            _attack = ""
        }
        return _attack
    }
    var weight: String{
        if _weight == nil{
            _weight = ""
        }
        return _weight
    }
    var height: String{
        if _height == nil{
            _height = ""
        }
        return _height
    }
    var defense: String{
        if _defense == nil{
            _defense = ""
        }
        return _defense
    }
    var type: String{
        if _type == nil{
            _type = ""
        }
        return _type
    }
    var description: String{
        if _description == nil{
            _description = ""
        }
        return _description
    }

    var name: String{
        return _name
    }
    var pokedexId: Int{
        return _pokedexId
    }
    
    init(name: String, pokedexID: Int){
        self._name = name
        self._pokedexId = pokedexID
        self._pokemonURL = "\(URL_BASE)\(URL_POKEMON)\(self.pokedexId)"
    }
    
    func downloadPokemonDetails(completed: @escaping DownloadComplete){
        Alamofire.request(_pokemonURL).responseJSON{
            (response) in
//            print(response.result.value!)
            if let dict = response.result.value as? Dictionary<String,AnyObject>{
                if let weight = dict["weight"] as? String{
                    self._weight = weight
                }
                if let height = dict["height"] as? String{
                    self._height = height
                }
                if let attack = dict["attack"] as? Int{
                    self._attack = "\(attack)"
                }
                if let defense = dict["defense"] as? Int{
                    self._defense = "\(defense)"
                }
                if let types = dict["types"] as? [Dictionary<String,String>],types.count>0{
                    if let name = types[0]["name"]{
                        self._type = name.capitalized
                    }
                    if types.count  > 1{
                        for x in 1..<types.count{
                            if let name = types[x]["name"]{
                                self._type! += "/\(name.capitalized)"
                            }
                            
                        }
                    }
                }else{
                    self._type = ""
                }
                
                if let descriptions = dict["descriptions"] as? [Dictionary<String,String>], descriptions.count>0{
                    
                    if let url = descriptions[0]["resource_uri"]{
                        let descURL = "\(URL_BASE)\(url)"
                        Alamofire.request(descURL).responseJSON(completionHandler: {
                            (response) in
                            
                            if let descDict = response.result.value as? Dictionary<String,AnyObject>{
                                if let description = descDict["description"] as? String{
                                    self._description = description
                                    print(description)
                                }
                            }
                            completed()
                            
                        })
                    }
                    
                }else{
                    self._description = ""
                }
                if let evolutions = dict["evolutions"] as? [Dictionary<String,AnyObject>], evolutions.count>0{
                    
                    if let nextEvo = evolutions[0]["to"] as? String{
                        if nextEvo.range(of: "mega") == nil{
                            self._nextEvolutionName = nextEvo
                            
                            if let uri = evolutions[0]["resource_uri"] as? String{
                                let newStr = uri.replacingOccurrences(of: "/api/v1/pokemon/", with: "")
                                let nextEvoId = newStr.replacingOccurrences(of: "/", with: "")
                                self._nextEvolutionId = nextEvoId
                                
                                if let lvlExist = evolutions[0]["level"]{
                                    if let lvl = lvlExist as? Int{
                                        self._nextEvolutionLvl = "\(lvl)"
                                    }
                                    
                                }else{
                                    self._nextEvolutionLvl = ""
                                }
                            }
                        }
                    }
                    
                }else{
                    
                }


            }
            // indica que o download terminou
            completed()
        }
    }
    
    
}
