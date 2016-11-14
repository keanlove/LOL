//
//  LiveModel.m
//  LOL
//
//  Created by Kean on 16/7/11.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "LiveModel.h"

@implementation LiveModel

- (id)initWithDictionary:(NSDictionary *)dictionary {

    if (self = [super init]) {
    
//        self.P = dictionary[@"P"];
//        self.W = dictionary[@"W"];
//        self.N = dictionary[@"N"];;
//        self.F = dictionary[@"F"];
//        self.T = dictionary[@"T"];
//        self.I = dictionary[@"I"];
//        
/**
 *  战旗
 */
        self.pic = dictionary[@"pic"];
        self.title = dictionary[@"title"];
        self.subtitle = dictionary[@"subtitle"];
        self.playurl = dictionary[@"playurl"];
        

        
    }
    
    return self;

}

@end
