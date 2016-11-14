//
//  FreeHeroModel.m
//  LOL
//
//  Created by Kean on 16/7/8.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "FreeHeroModel.h"

@implementation FreeHeroModel
- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        
        self.name = dictionary[@"name"];
        self.title = dictionary[@"title"];
        self.Id = dictionary[@"id"];
    }
    
    return self;
}

@end













