//
//  HeroSingleton.m
//  LOL
//
//  Created by Kean on 16/7/6.
//  Copyright © 2016年 Kean. All rights reserved.
//

#import "HeroSingleton.h"

@implementation HeroSingleton

+(HeroSingleton *)shareData {
    
    static HeroSingleton *heroId = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        heroId = [[HeroSingleton alloc] init];
    });

    return heroId;
}
@end
