//
//  FETabBarButton.m
//  
//
//  Created by singleton on 14-10-28.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "FETabBarButton.h"

@implementation FETabBarButton
+ (instancetype)tabbarButtonWithImage:(UIImage*)imageN
                               imageH:(UIImage*)imageH
                               imageS:(UIImage*)imageS
                               titleN:(NSString*)titleN
                               titleH:(NSString*)titleH
                               titleS:(NSString*)titleS{
    FETabBarButton *button = [FETabBarButton buttonWithType:UIButtonTypeCustom];
    [button setImage:imageN forState:UIControlStateNormal];
    [button setImage:imageH forState:UIControlStateHighlighted];
    [button setImage:imageS forState:UIControlStateSelected];
    [button setTitle:titleN forState:UIControlStateNormal];
    [button setTitle:titleH forState:UIControlStateHighlighted];
    [button setTitle:titleS forState:UIControlStateSelected];
    
    return button;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    UIImageView *imageView = [self imageView];
    CGRect imageFrame = imageView.frame;
    imageFrame.origin.x = (int)((self.frame.size.width - imageFrame.size.width)/ 2);
    imageFrame.origin.y = imageFrame.origin.y - 6.0f;
    imageView.frame = imageFrame;
    
    UILabel *titleLabel = [self titleLabel];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    titleLabel.font = [UIFont systemFontOfSize:10.0];
    titleLabel.frame = CGRectMake(0, MAX(36, imageView.frame.origin.y + imageView.frame.size.height), self.frame.size.width, titleLabel.frame.size.height);
}


@end
