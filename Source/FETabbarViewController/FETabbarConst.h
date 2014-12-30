//
//  FETabbarConst.h
//  
//
//  Created by singleton on 14-10-26.
//  Copyright (c) 2014年 . All rights reserved.
//
#import <Foundation/Foundation.h>
#import "FECustomTabBarItem.h"

#define FE_BRIDGE(x)          ((__bridge void*)x)
#define kStatusOffset         (([[[UIDevice currentDevice] systemVersion] floatValue] > 6.1)? 20 : 0) //ios7.0适配
#define FERGB(r,g,b,a)        [UIColor colorWithRed:r/225.0 green:g/225.0  blue:b/225.0  alpha:a]
//#define FERGBHex(r,g,b,a)     [UIColor colorWithRed:r/225.0 green:g/225.0  blue:b/225.0  alpha:a/225.0];
