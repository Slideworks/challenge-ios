//
//  Pokemon.h
//  PokeApp
//
//  Created by Antonio Alves on 9/21/15.
//  Copyright © 2015 Antonio Alves. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Pokemon : NSObject

@property (strong, nonatomic) NSString *name;
@property (nonatomic) int aid;
@property (strong, nonatomic) NSString *url_pic;
@property (strong, nonatomic) NSString *specie;
@property (strong, nonatomic) NSString *type;

@property (strong, nonatomic) NSDictionary *dict;

- (id)initWithName:(NSString *)name
                        aid:(int)aid
                        pic:(NSString *)pic
                     specie:(NSString *)specie
                       type:(NSString *)type;

- (id)initWithDictionary:(NSDictionary *)dict;

@end
