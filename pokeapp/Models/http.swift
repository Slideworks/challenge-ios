//
//  http.swift
//  pokeapp
//
//  Created by Maik on 27/04/17.
//  Copyright © 2017 Maik. All rights reserved.
//

import Foundation
import ObjectMapper

class http: Mappable  {
    
    var origin:String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        origin   <- map["origin"]
    }
    
}
