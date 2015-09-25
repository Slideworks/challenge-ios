//
//  DetailViewController.m
//  PokeApp
//
//  Created by Antonio Alves on 9/21/15.
//  Copyright © 2015 Antonio Alves. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailId.text = self.detailaid;
    self.detailName.text = self.detailN;
    self.speciesDetail.text = self.detailSpecies;
    self.typesDetail.text = self.detailTypes;
    

    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo.png"]];
    
}



@end
