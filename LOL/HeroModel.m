//
//  HeroModel.m
//  LOL
//
//  Created by Kean on 16/7/4.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "HeroModel.h"

@implementation HeroModel

- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        
        self.Id = dictionary[@"Id"];
        self.Pic = dictionary[@"Pic"];
        self.NickName = dictionary[@"NickName"];
        self.CName = dictionary[@"CName"];
        self.PubTime = dictionary[@"PubTime"];
        self.VideoCount = dictionary[@"VideoCount"];
    }

    return self;
}

@end










