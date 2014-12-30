//
//  FEViewController.m
//  
//
//  Created by singleton on 14-10-28.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "FEViewController.h"

@interface FEViewController ()
@property(nonatomic, strong)UIButton *backButton;
@end

@implementation FEViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] <7.0) {
        [self.navigationController.navigationBar setBackgroundImage:[FEViewController imageWithColor:[UIColor lightGrayColor] rect:self.navigationController.navigationBar.bounds] forBarMetrics:UIBarMetricsDefault];
    }
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.backButton];
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - BackButtonClicked
- (void)backButtonClicked:(UIButton*)button{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Privte Method
- (UIButton *)backButton{
    if (_backButton == nil) {
        _backButton =  [UIButton buttonWithType:UIButtonTypeCustom];
        [_backButton setImage:[UIImage imageNamed:@"back"]  forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"back"]  forState:UIControlStateHighlighted];
        [_backButton setFrame:CGRectMake(0, 0, 40, 40)];
        [_backButton setImageEdgeInsets:UIEdgeInsetsMake(0, -40, 0, 0)];
        [_backButton addTarget:self action:@selector(backButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

/**
 由色块产生一张图
 @param rect 大小
 @returns 图片
 */
+ (UIImage *)imageWithColor:(UIColor*) color rect:(CGRect)rect
{
    color = color==nil?[UIColor clearColor]:color;
    NSInteger scale = [UIScreen mainScreen].scale > 1.0 ? 2 : 1;
    if (scale > 1)
    {
        rect = CGRectMake(rect.origin.x * scale, rect.origin.y * scale, rect.size.width * scale, rect.size.height * scale);
    }
    NSInteger width  = rect.size.width;
    NSInteger height = rect.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = CGBitmapContextCreate (NULL, width, height, 8, width * 4, colorSpace, (CGBitmapInfo)(CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    CGContextSetFillColorWithColor(context,color.CGColor);
    CGContextFillRect(context,rect);
    CGImageRef imageRef2 = CGBitmapContextCreateImage(context);
    UIImage   *imageRet  = [UIImage imageWithCGImage:imageRef2 scale:scale orientation:UIImageOrientationUp];
    
    CGImageRelease(imageRef2);
    CGContextRelease(context);
    CGColorSpaceRelease(colorSpace);
    return imageRet;
}
@end
