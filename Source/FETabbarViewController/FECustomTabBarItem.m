//
//  FECustomTabBarItem.m
//  
//
//  Created by singleton on 14-10-26.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "FECustomTabBarItem.h"
@interface FECustomTabBarItem()
{
    UIImage *_customHighlightedImage;
    UIImage *_customNormalImage;
}
@end

@implementation FECustomTabBarItem

- (id)initWithTitle:(NSString *)title
        normalImage:(UIImage *)normalImage
   highlightedImage:(UIImage *)highlightedImage
                tag:(NSInteger)tag{
    
   self = [super initWithTitle:title
                  image:nil
                    tag:tag];
    [self setCustomNormalImage:normalImage];
    [self setCustomHighlightedImage:highlightedImage];
    return self;
}

-(UIImage *) selectedImage
{
    return self.customHighlightedImage;
}

-(UIImage *) unselectedImage
{
    return self.customNormalImage;
}

@end
