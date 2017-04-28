//
//  Pokemon.swift
//  pokeapp
//
//  Created by Maik on 26/04/17.
//  Copyright © 2017 Maik. All rights reserved.
//

import Foundation
import ObjectMapper

class Pokemon: Mappable  {
    
    var name:String?
    var pokemon:Array<PokemonDetalhes>?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name    <- map["name"]
        pokemon <- map["pokemon"]
    }
    
}

class PokemonDetalhes: Mappable  {
    
    var name:String?
    var resource_uri:String?
    var pkdx_id:Int?
    var species:String?
    var types:Array<Types>?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name            <- map["name"]
        resource_uri    <- map["resource_uri"]
        pkdx_id         <- map["pkdx_id"]
        species         <- map["species"]
        types           <- map["types"]
    }
    
}

class Types: Mappable  {
    
    var name:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name            <- map["name"]
    }
    
}
