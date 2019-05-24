//
//  FLLoopScrollView.m
//  CycleScrollViewDemo
//
//  Created by Puhui on 16/8/17.
//  Copyright © 2016年 com.puhuifinance.flex. All rights reserved.
//

#import "FLLoopScrollView.h"

@interface FLLoopScrollView ()<iCarouselDataSource,iCarouselDelegate>
{
    NSTimeInterval         animationDuration;///<滚动时间
    NSTimer                *animationTimer;///<滚动的定时器
    CGFloat                scrollDistance;///<每次滚动的大小

}

@end
@implementation FLLoopScrollView

- (void)dealloc{
    _iCarousel.delegate = nil;
    _iCarousel.dataSource = nil;
}

- (id)initWithFrame:(CGRect)frame animationDuration:(NSTimeInterval)duration scrollDistance:(CGFloat)distance{
    self = [self initWithFrame:frame];
    if (self) {
        animationDuration = duration;
        scrollDistance = distance;
        [self addSubviews];
        [self setupTimerWithDuration:animationDuration];

    }
    return self;
}
- (void)setupTimerWithDuration:(NSTimeInterval)duration
{
    if (animationDuration > 0.0) {
        animationTimer = [NSTimer scheduledTimerWithTimeInterval:(animationDuration = duration)
                                                           target:self
                                                         selector:@selector(animationTimerDidFired:)
                                                         userInfo:nil
                                                          repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:animationTimer forMode:NSRunLoopCommonModes];
        
        [self pauseTimer];
    }
    
}

- (void)animationTimerDidFired:(NSTimer *)timer
{
    NSInteger currentIndex = _iCarousel.currentItemIndex;
    NSInteger totalPages = _iCarousel.numberOfItems;
    if (totalPages > 1) {
        currentIndex ++;
        if (scrollDistance == self.frame.size.width) {
            [_iCarousel scrollToItemAtIndex:currentIndex animated:YES];
        }else{
            [_iCarousel scrollByOffset:scrollDistance/self.frame.size.width duration:animationDuration];
        }
    }
}


#pragma mark --
#pragma mark 当自己重写一个UIView的时候有可能用到这个方法,当本视图的父类视图改变的时候,系统会自动的执行这个方法.newSuperview是本视图的新父类视图.newSuperview有可能是nil.

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview == nil) {
        if (animationTimer) {
            [animationTimer invalidate];
            animationTimer = nil;
        }
    }
}



#pragma mark --
#pragma mark 布局

- (void)addSubviews
{
    _iCarousel = [[iCarousel alloc] initWithFrame:self.bounds];
    _iCarousel.dataSource = self;//(id<iCarouselDataSource>)
    _iCarousel.delegate = self;//(id<iCarouselDelegate>)
    _iCarousel.type = iCarouselTypeLinear;
    _iCarousel.decelerationRate = 0.5;
//    _iCarousel.scrollOffset = 2;
    _iCarousel.clipsToBounds = YES;
    [self addSubview:_iCarousel];
}
#pragma mark -公共方法
- (void)reloadData{
    [_iCarousel reloadData];
    [self resumeTimerAfterTimeInterval:animationDuration];
}

- (void)setScrollEnabled:(BOOL)scrollEnabled{
    _iCarousel.scrollEnabled = scrollEnabled;
}

- (BOOL)scrollEnabled{
    return _iCarousel.scrollEnabled;
}

- (BOOL)vertial{
    return _iCarousel.vertical;
}

- (void)setVertial:(BOOL)vertial{
    _iCarousel.vertical = vertial;
}


- (void)pauseScroll;
{
    [self pauseTimer];
}

- (void)resumeScrollAfterTimeInterval:(NSTimeInterval)interval{
    [self resumeTimerAfterTimeInterval:interval];
}

- (void)resumeScrollTimerAfterTimeInterval:(NSTimeInterval)interval
{
    NSInteger totalPages = _iCarousel.numberOfItems;
    if (totalPages > 1) {
        [self resumeTimerAfterTimeInterval:animationDuration];
    }
}

#pragma mark --
#pragma mark 定时器的管理
-(void)pauseTimer
{
    if (![animationTimer isValid]) {
        return ;
    }
    [animationTimer setFireDate:[NSDate distantFuture]];
}
-(void)resumeTimer
{
    if (![animationTimer isValid]) {
        return ;
    }
    [animationTimer setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![animationTimer isValid]) {
        return ;
    }
    [animationTimer setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}


#pragma mark -iCarouselDataSource
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(numberOfPages)]) {
        return (long)[self.dataSource numberOfPages];
    }
    return 0;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (self.dataSource && [self.dataSource respondsToSelector:@selector(viewForPageAtIndex:reusingView:)]) {
        return [self.dataSource viewForPageAtIndex:index reusingView:view];
    }
    return nil;
}

#pragma mark -iCarouselDelegate

- (void)carouselCurrentItemIndexUpdated:(iCarousel *)carousel{
    if (self.delegate && [self.delegate respondsToSelector:@selector(currentPageIndexUpdated:)]) {
//        NSLog(@"carouselCurrentItemIndexUpdated");
        [self.delegate currentPageIndexUpdated:carousel.currentItemIndex];
    }
}
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(currentPageIndexUpdated:)]) {
//        NSLog(@"carouselCurrentItemIndexUpdated");
        [self.delegate currentPageIndexUpdated:carousel.currentItemIndex];
    }
    
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"carousel:(iCarousel *)carousel didSelectItemAtIndex");
    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectItemAtIndex:)]) {
        [self.delegate didSelectItemAtIndex:index];
    }
}


- (CGFloat)carousel:(__unused iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value
{
    //customize carousel display
    switch (option)
    {
        case iCarouselOptionWrap:
        {
            //normally you would hard-code this to YES or NO
            return YES;
        }
        default:
        {
            return value;
        }
    }
}

- (void)carouselWillBeginDragging:(iCarousel *)carousel{
    [self pauseTimer];
}
- (void)carouselDidEndDragging:(iCarousel *)carousel willDecelerate:(BOOL)decelerate{
    [self resumeTimerAfterTimeInterval:animationDuration];
}


@end
