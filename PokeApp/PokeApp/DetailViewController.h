//
//  DetailViewController.h
//  PokeApp
//
//  Created by Antonio Alves on 9/21/15.
//  Copyright © 2015 Antonio Alves. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *detailId;
@property (weak, nonatomic) IBOutlet UILabel *detailName;
@property (weak, nonatomic) IBOutlet UILabel *speciesDetail;
@property (weak, nonatomic) IBOutlet UILabel *typesDetail;

@property (strong, nonatomic) NSString *detailaid;
@property (strong, nonatomic) NSString *detailN;
@property (strong, nonatomic) NSString *detailSpecies;
@property (strong, nonatomic) NSString *detailTypes;
@end
