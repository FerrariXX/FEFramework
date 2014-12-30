//
//  FECustomTabBarController.m
//  
//
//  Created by singleton on 14-10-27.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "FECustomTabBarController.h"
#import "FETabbarConst.h"
@interface FECustomTabBarController ()
@property (nonatomic, strong) NSMutableArray*               tabBarItems;

@end

@implementation FECustomTabBarController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if([self.tabBar.subviews containsObject:self.customeTabBar]){
        [self.tabBar bringSubviewToFront:self.customeTabBar];
    }
    else{
        [self.tabBar addSubview:self.customeTabBar];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    self.customeTabBar = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public Method


- (void)setViewControllers:(NSArray *)viewControllers {
    [super setViewControllers:viewControllers];
    [self updateTabBarItems];
}

#pragma mark - Privte Method
- (FECustomTabBar *)customeTabBar{
    if (_customeTabBar == nil) {
        _customeTabBar = [[FECustomTabBar alloc] initWithFrame:CGRectMake(0, 0, self.tabBar.frame.size.width, self.tabBar.frame.size.height)];
        __weak typeof(self) weakSelf = self;
        _customeTabBar.selectedBlock = ^(NSInteger index){
            [weakSelf tabBarDidSelectAtIndex:index];
        };
    }
    return _customeTabBar;
}

- (void)updateTabBarItems{
    NSMutableArray* items = [[NSMutableArray alloc] init];
    for (UIViewController* controller in self.viewControllers) {
        if ([controller isKindOfClass:[UINavigationController class]]) {
            UIViewController *topVC = ((UINavigationController*)controller).topViewController;
            [items addObject:topVC.tabBarItem];
        }else if ([controller isKindOfClass:[UIViewController class]]) {
            [items addObject:controller.tabBarItem];
        }
    }
    self.tabBarItems = items;
    [self.customeTabBar setItems:items];
}

- (void)tabBarDidSelectAtIndex:(NSInteger)index{
    NSLog(@">>>>tabBarDidSelectAtIndex %d",index);
    UIViewController *vc = [self.viewControllers objectAtIndex:index];
    if ([vc isKindOfClass:[UINavigationController class]]) {
        [((UINavigationController *)vc) popToRootViewControllerAnimated:NO];
    }
    
    BOOL isShouldSelected = YES;
    if(self.delegate && [self.delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)]){
        UIViewController *vc = [self.viewControllers objectAtIndex:index];
       isShouldSelected =  [self.delegate tabBarController:self shouldSelectViewController:vc];
    }
    
    if (isShouldSelected) {
        [self setSelectedIndex:index];
        
        if(self.delegate && [self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)])
        {
            UIViewController *vc = [self.viewControllers objectAtIndex:index];
            [self.delegate tabBarController:self didSelectViewController:vc];
        }
    }
}

@end
