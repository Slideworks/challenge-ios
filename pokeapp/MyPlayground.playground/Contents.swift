//: Playground - noun: a place where people can play

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

Alamofire.request("https://pokeapi.co/api/v1/pokedex/1/").responseJSON { (responseData) -> Void in
    
    if((responseData.result.value) != nil) {
        
        let json = JSON(responseData.result.value!)
        
        print("\(json["pokemon"])")
    }
        
}

