//
//  FECustomTabBar.h
//  
//
//  Created by singleton on 14-10-27.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^FETabBarSelectedBlock)(NSInteger index);

@interface FECustomTabBar : UIView
@property (nonatomic, strong) NSArray*          items;
@property (nonatomic, copy)FETabBarSelectedBlock selectedBlock;
@end
