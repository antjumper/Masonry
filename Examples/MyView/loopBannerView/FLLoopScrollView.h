//
//  FLLoopScrollView.h
//  CycleScrollViewDemo
//
//  Created by Puhui on 16/8/17.
//  Copyright © 2016年 com.puhuifinance.flex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@protocol FLLoopScrollViewDataSource ,FLLoopScrollViewDelegate;

typedef NS_ENUM(NSInteger,FLLoopScrollType){
    FLLoopScrollType_Vertical = 1,
    FLLoopScrollType_horizontal,
};

@interface FLLoopScrollView : UIView

@property (nonatomic,strong) iCarousel *iCarousel; ///<在旋转木马的基础上实现的

@property (nonatomic ,weak) id<FLLoopScrollViewDataSource> dataSource; ///<仿照tableview的dataSource

@property (nonatomic ,weak) id<FLLoopScrollViewDelegate> delegate; ///<仿照tableview的delegate

//@property (nonatomic ,assign) BOOL autoscrollEnabled;  ///<是否可以自动滚动

@property (nonatomic,assign) BOOL scrollEnabled; ///<是否支持手动滑动

@property (nonatomic,assign) BOOL vertial;///<scrollView 布局是横向还是竖向  默认是横向的

/**
 *  初始化
 *
 *  @param frame             frame
 *  @param duration 自动滚动的间隔时长。如果<=0，不自动滚动。
 *  @param distance    每次滚动滚动的宽度
 *  @return instance
 */
- (id)initWithFrame:(CGRect)frame animationDuration:(NSTimeInterval)duration scrollDistance:(CGFloat)distance;

/**
 * 刷新数据；
 **/
- (void)reloadData;

/**
 *
 *暂停滚动;
 *
 **/
- (void)pauseScroll;

/**
 *
 继续滚动;
 *
 **/
- (void)resumeScrollAfterTimeInterval:(NSTimeInterval)interval;


@end

@protocol FLLoopScrollViewDataSource <NSObject>
/**
 * 数据源：获取总的page个数
 *
 **/
- (NSUInteger)numberOfPages;

/**
 *  生成相应位置的view
 *  @param index        第几页的
 *   @param view     对应的view
 **/
- (UIView *)viewForPageAtIndex:(NSUInteger)index reusingView:(UIView *)view;

@end

@protocol FLLoopScrollViewDelegate <NSObject>

/**
 *  更新相应pageIndex的数据
 *  @param index        第几页的
 *
 **/

- (void)currentPageIndexUpdated:(NSInteger)index;

/**
 *  点击pageIndex位置
 *  @param index        第几页的
 *
 **/

- (void)didSelectItemAtIndex:(NSInteger)index;


@end

