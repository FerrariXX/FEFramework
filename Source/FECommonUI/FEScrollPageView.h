//
//  FEScrollPageView.h
//
//
//  Created by xxx on 14-5-18.
//  Copyright (c) 2014年 . All rights reserved.
//

#import <UIKit/UIKit.h>

@class FEImageItem;
typedef void(^FEScrollPageSelectedBlock)(FEImageItem* sender);

@interface FEImageItem : NSObject
@property (nonatomic, retain)  NSString      *title;
@property (nonatomic, retain)  NSString      *imageURL;
@property (nonatomic, assign)  NSInteger     tag;

- (instancetype)initWithTitle:(NSString *)title imageURL:(NSString *)imageURL tag:(NSInteger)tag;
@end

@interface FEScrollPageView : UIView
@property(nonatomic, assign)BOOL                    isAutoPlay;
@property(nonatomic, copy)FEScrollPageSelectedBlock selectedBlock;

- (instancetype)initWithFrame:(CGRect)frame
                   imageItems:(NSArray*)items
                selectedBlock:(FEScrollPageSelectedBlock)selectedBlock
                   isAutoPlay:(BOOL)isAutoPlay;

- (void)setImageItems:(NSArray*)items
        selectedBlock:(FEScrollPageSelectedBlock)selectedBlock
           isAutoPlay:(BOOL)isAutoPlay;

- (void)stopAutoPlay;
@end
