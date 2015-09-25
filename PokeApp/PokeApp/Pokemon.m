//
//  Pokemon.m
//  PokeApp
//
//  Created by Antonio Alves on 9/21/15.
//  Copyright © 2015 Antonio Alves. All rights reserved.
//

#import "Pokemon.h"

@implementation Pokemon

- (id)initWithName:(NSString *)name aid:(int)aid pic:(NSString *)pic specie:(NSString *)specie type:(NSString *)type {
    self = [super init];
    
    if (self) {
        _name = name;
        _aid = aid;
        _url_pic = pic;
        _specie = specie;
        _type = type;
    }
    
    return self;
}

- (id)initWithDictionary:(NSDictionary *)dict {
    
    self = [super init];
    
    if (self) {
        _dict = dict;
    }

    return self;
}

@end
