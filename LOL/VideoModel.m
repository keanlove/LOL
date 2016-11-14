//
//  VideoModel.m
//  LOL
//
//  Created by Kean on 16/7/5.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel
//
- (id)initWithDictionary:(NSDictionary *)dictionary {
    
    if (self = [super init]) {
        
        self.I = dictionary[@"I"];
        self.P = dictionary[@"P"];
        self.T = dictionary[@"T"];
        self.A = dictionary[@"A"];
        self.V = dictionary[@"V"];
        self.Key = dictionary[@"Key"];
        self.F = dictionary[@"F"];
        
    }
    
    return self;
}



@end
