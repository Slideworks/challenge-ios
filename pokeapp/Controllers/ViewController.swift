//
//  ViewController.swift
//  pokeapp
//
//  Created by Maik on 26/04/17.
//  Copyright © 2017 Maik. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

    class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
        
        @IBOutlet var tblJSON: UITableView!
        var nomes = [String]()
        var urls = [String]()
        var urlPokemon:String?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            let logo = UIImage(named: "logo.png")
            let imageView = UIImageView(image:logo)
            self.navigationItem.titleView = imageView
            
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg1.png")!)
            
            Alamofire.request("https://pokeapi.co/api/v1/pokedex/1/").responseJSON { response in
                
                if let JSON = response.result.value {
                    
                    if let dict:Dictionary<String, Any> = JSON as? Dictionary<String, Any>{
                        
                        if let itens = Mapper<Pokemon>().map(JSONObject: dict){
                            
                            for poke in itens.pokemon!{
                                self.nomes.append(poke.name!)
                                self.urls.append(poke.resource_uri!)
                            }
                            
                        }
                        
                    }
                    
                }
                
                self.tblJSON.reloadData()
                
            }
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            let view = segue.destination as! PokemonController
            
            if let indexPath = self.tblJSON.indexPathForSelectedRow {
                let url = urls[indexPath.row]
                view.url = url
            }
            
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return nomes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let nome = nomes[indexPath.row]
            let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: nil)
            cell.textLabel!.text = nome
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
            if tableView.cellForRow(at: indexPath) != nil {
                
                self.performSegue(withIdentifier: "pokemonDetalhes", sender: self.urls[indexPath.row])
                
            }
        }
        
        func tableView(_ willDisplayforRowAttableView: UITableView, willDisplay cell: UITableViewCell,
                       forRowAt indexPath: IndexPath) {
            cell.textLabel?.textColor = UIColor.white
            cell.contentView.backgroundColor = UIColor.clear
            cell.backgroundColor = UIColor.clear
            tblJSON.backgroundColor = UIColor.clear
        }
        
    }
