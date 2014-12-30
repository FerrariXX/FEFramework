//
//  FECustomTabBarItem.h
//  
//
//  Created by singleton on 14-10-26.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FECustomTabBarItem : UITabBarItem
@property (nonatomic, strong) UIImage *customHighlightedImage;
@property (nonatomic, strong) UIImage *customNormalImage;
@property (nonatomic, strong) UIView  *customView;//如果有此项，则默认使用此项

- (id)initWithTitle:(NSString *)title
        normalImage:(UIImage *)normalImage
   highlightedImage:(UIImage *)highlightedImage
                tag:(NSInteger)tag;
@end
