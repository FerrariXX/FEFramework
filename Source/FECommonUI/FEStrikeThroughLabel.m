//
//  FEStrikeThroughLabel.m
//
//
//  Created by admin on 14-9-15.
//
//

#import "FEStrikeThroughLabel.h"

@implementation FEStrikeThroughLabel
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _strikeThroughEnabled = YES;
        _style = FEStrikeThroughMiddleStyle;
    }
    return self;
}


- (void)drawTextInRect:(CGRect)rect{
    [super drawTextInRect:rect];
    
    CGSize textSize = [[self text] sizeWithFont:[self font]];
    CGFloat strikeWidth = textSize.width;
    CGRect lineRect;
    CGFloat originY;
    
    if (self.style==FEStrikeThroughBottomStyle) {
        originY = rect.size.height - 1;
    }else {
        originY = rect.size.height/2;
    }
    
    
    if ([self textAlignment] == UITextAlignmentRight) {
        lineRect = CGRectMake(rect.size.width - strikeWidth, originY, strikeWidth, 1);
    } else if ([self textAlignment] == UITextAlignmentCenter) {
        lineRect = CGRectMake(rect.size.width/2 - strikeWidth/2, originY, strikeWidth, 1);
    } else {
        lineRect = CGRectMake(0, originY, strikeWidth, 1);
    }
    
    if (_strikeThroughEnabled) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetLineWidth(context, 1);
        CGContextSetStrokeColorWithColor(context, [self.textColor CGColor]);
        CGContextMoveToPoint(context, lineRect.origin.x, lineRect.origin.y);
        CGContextAddLineToPoint(context, lineRect.origin.x+lineRect.size.width,lineRect.origin.y);
        CGContextStrokePath(context);
        //CGContextRef context = UIGraphicsGetCurrentContext();
        //CGContextFillRect(context, lineRect);
    }
}

- (void)setStrikeThroughEnabled:(BOOL)strikeThroughEnabled {
    
    _strikeThroughEnabled = strikeThroughEnabled;
    
    NSString *tempText = [self.text copy];
    self.text = @"";
    self.text = tempText;
}

-(void)setStyle:(FEStrikeThroughStyle)style{
    _style = style;
    [self setNeedsDisplay];
}

@end
