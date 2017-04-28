//
//  PokemonController.swift
//  pokeapp
//
//  Created by Maik on 27/04/17.
//  Copyright © 2017 Maik. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class PokemonController: UIViewController{
    
    var url:String = ""
    
    @IBOutlet var id:UILabel?
    @IBOutlet var namePoke:UILabel?
    @IBOutlet var speciesPoke:UILabel?
    @IBOutlet var typesPoke:UILabel?
    
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let logo = UIImage(named: "logo.png")
            let imageView = UIImageView(image:logo)
            self.navigationItem.titleView = imageView
            
                self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg2.png")!)
                
                Alamofire.request("https://pokeapi.co/\(self.url)").responseJSON { response in
                    
                    if let JSON = response.result.value {
                        
                        if let dict:Dictionary<String, Any> = JSON as? Dictionary<String, Any>{
                            
                            if let item = Mapper<PokemonDetalhes>().map(JSONObject: dict){
                                
                                if let cod = item.pkdx_id{
                                    self.id?.text = "#0\(cod)"
                                }
        
                                if let name = item.name{
                                    self.namePoke?.text = "\(name)"
                                }
                                
                                if let specie = item.species{
                                    self.speciesPoke?.text = "\(specie)"
                                }
                                
                                for types in item.types!{
                                    
                                    if let type = types.name{
                                        self.typesPoke?.text = "\(type)"
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
            
        }
        
}
