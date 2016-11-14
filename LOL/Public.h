//
//  Public.h
//  LOL
//
//  Created by Kean on 16/7/1.
//  Copyright © 2016年 Kean. All rights reserved.
//

#ifndef Public_h
#define Public_h

// 相对iphone6S 屏幕比
#define KWidth_ScaleW [UIScreen mainScreen].bounds.size.width/414.0f
#define KWidth_ScaleH [UIScreen mainScreen].bounds.size.height/736.0f

// tabBar的背景色
#define TabBar_T_Color RGB(191, 31, 31)
// RGB
#define RGBA(r, g, b, a)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)  RGBA(r, g, b, 1.0f)

// 系统版本
#define SYTEM_VERSION [[UIDevice currentDevice].systemVersion floatValue]

// 设备物理尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height


#endif /* Public_h */
