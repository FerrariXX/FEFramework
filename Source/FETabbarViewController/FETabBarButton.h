//
//  FETabBarButton.h
//  
//
//  Created by singleton on 14-10-28.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FETabBarButton : UIButton
+ (instancetype)tabbarButtonWithImage:(UIImage*)imageN
                               imageH:(UIImage*)imageH
                               imageS:(UIImage*)imageS
                               titleN:(NSString*)titleN
                               titleH:(NSString*)titleH
                               titleS:(NSString*)titleS;
@end
