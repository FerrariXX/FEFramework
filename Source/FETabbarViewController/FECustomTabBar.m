//
//  FECustomTabBar.m
//  
//
//  Created by singleton on 14-10-27.
//  Copyright (c) 2014年 . All rights reserved.
//

#import "FECustomTabBar.h"
#import "FETabbarConst.h"
#import "UITabBarItem+FECustomBarItem.h"

@interface FECustomTabBar()
@property (nonatomic, strong)UIView             *backView;
@property (nonatomic, strong)NSMutableArray     *itemViews;
@property (nonatomic, assign)NSInteger          selectedIndex;


@end

@implementation FECustomTabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor =  FERGB(0xec, 0xee, 0xf0, 1.0);
        self.selectedIndex   = 0;
    }
    return self;
}

- (void)dealloc{
    for (UIView *itemView  in self.itemViews) {
        if ([itemView isKindOfClass:[UIButton class]]) {
            UIButton *button = (UIButton*)itemView;
            [button removeTarget:self action:nil forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

#pragma mark - Public Method
- (void)setItems:(NSArray *)items {
    if (_items != items) {
        _items = items;
    
        [self.itemViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
        self.itemViews = [[NSMutableArray alloc] init];
        NSInteger index= 0;
        for (UITabBarItem* item in _items) {
            UIView *itemView = item.FECustomView;
            itemView.tag = index++;
            if (itemView) {
                if ([itemView isKindOfClass:[UIButton class]]) {
                    UIButton *button = (UIButton*)itemView;
                    [[button allTargets] enumerateObjectsUsingBlock:^(id obj, BOOL *stop) {
                        if (obj) {
                            [button removeTarget:obj action:nil forControlEvents:UIControlEventTouchUpInside];
                        }
                    }];
                    [button addTarget:self action:@selector(tabBarItemPressed:) forControlEvents:UIControlEventTouchUpInside];
                }//else view touch block
                [self.itemViews addObject:itemView];
            }
        }
    }
}
#pragma mark - Override
-(void)layoutSubviews{
    [super layoutSubviews];
    
    [self.itemViews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    CGFloat width = self.frame.size.width / [self.itemViews count];
    for (int i = 0; i < [self.itemViews count]; ++ i) {
        UIView* itemView = [self.itemViews objectAtIndex:i];
        [itemView setFrame:CGRectMake(i*width, 0, width, self.frame.size.height)];
        [self addSubview:itemView];
    }
}



//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    NSLog(@">>>>%@",NSStringFromCGPoint(point));
//    return [super pointInside:point withEvent:event];
//}

#pragma mark - Privte Method
- (UIView *)backView {
    if (_backView == nil) {
        _backView = [[UIView alloc] initWithFrame:CGRectZero];
        _backView.backgroundColor = FERGB(0x2e, 0x39, 0x48, 1.0);
        _backView.userInteractionEnabled = NO;
    }
    return _backView;
}

#pragma mark - Event 
- (void)tabBarItemPressed:(UIButton*)sender{
    UIButton *button = [self.itemViews objectAtIndex:self.selectedIndex];
    button.selected = NO;
    sender.selected = YES;
    self.selectedIndex = sender.tag;
    if (self.selectedBlock) {
        self.selectedBlock(sender.tag);
    }
}




@end
