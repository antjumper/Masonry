//
//  FLXScrollView.m
//  Masonry iOS Examples
//
//  Created by 刘红波 on 2017/8/18.
//  Copyright © 2017年 Jonas Budelmann. All rights reserved.
//

#import "FLXScrollView.h"
@interface FLXScrollView ()<iCarouselDataSource,iCarouselDelegate>
{
    NSTimeInterval         animationDuration;///<滚动时间
    NSTimer                *animationTimer;///<滚动的定时器
    CGFloat                scrollDistance;///<每次滚动的大小
}
@end

@implementation FLXScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
