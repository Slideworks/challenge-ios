//
//  ViewController.h
//  PokeApp
//
//  Created by Antonio Alves on 9/21/15.
//  Copyright © 2015 Antonio Alves. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Pokemon.h"
#import <AFNetworking.h>
#import "DetailViewController.h"


@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *pokeTable;
@property (strong, nonatomic) NSMutableArray *pokemons;
@property (strong, nonatomic) NSMutableArray *ps;
@property (strong, nonatomic) NSDictionary *json;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *load;

@end

