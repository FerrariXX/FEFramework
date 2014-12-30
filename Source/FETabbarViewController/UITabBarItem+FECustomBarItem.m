//
//  UITabBarItem+FECustomBarItem.m
//  
//
//  Created by singleton on 14-10-27.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "UITabBarItem+FECustomBarItem.h"
#import <objc/runtime.h>
#import <objc/message.h>
#import "FETabbarConst.h"

static NSString * const FETabBarCustomViewKey = @"FETabBarCustomViewKey";

@implementation UITabBarItem (FECustomBarItem)

- (void)setFECustomView:(UIView*)view{
    objc_setAssociatedObject(self, FE_BRIDGE(FETabBarCustomViewKey), view, OBJC_ASSOCIATION_RETAIN);
}

- (UIView *)FECustomView{
    return objc_getAssociatedObject(self, FE_BRIDGE(FETabBarCustomViewKey));
}
@end
