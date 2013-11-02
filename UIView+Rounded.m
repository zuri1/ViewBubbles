//
//  UIView+Rounded.m
//  Happy View Bubble Friends
//
//  Created by Zuri Biringer on 11/1/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "UIView+Rounded.h"

@implementation UIView (Rounded)

+ (UIView *)roundedViewWithFrame:(CGRect)frame
{
    UIView *roundedView = [[UIView alloc] initWithFrame:frame];
    
    roundedView.layer.cornerRadius = 30.f;
    roundedView.clipsToBounds = YES;
    
    return roundedView;
}

@end
