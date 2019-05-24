//
//  ADView.m
//  loanCustomer
//
//  Created by Puhui on 16/8/18.
//  Copyright © 2016年 凡普金融. All rights reserved.
//

#import "ADView.h"
static NSTimeInterval const kDuration = 3.0f;

@interface ADView ()<FLLoopScrollViewDataSource ,FLLoopScrollViewDelegate>{
    FLLoopScrollView  *_scrollerView;
    UIPageControl                     *_pageControl;
    UIView                     *_bottomLine;
    NSInteger                _adviewCurrentIndex;

}
@property(nonatomic,strong) NSMutableArray *advertisementModels;

//@property (nonatomic,copy) ADViewDidClickBlock adDidClickBlock;

@end
@implementation ADView

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidBecomeActiveNotification object:nil];

    _scrollerView = nil;
    _pageControl = nil;
    _advertisementModels = nil;
    
}
-(instancetype) initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame])
    {
        _advertisementModels = [NSMutableArray array];
        _adviewCurrentIndex = 0;
        _scrollerView = [[FLLoopScrollView alloc] initWithFrame:CGRectMake(0.0,0.0, frame.size.width, frame.size.height) animationDuration:kDuration scrollDistance:frame.size.width];
        _scrollerView.dataSource = self;
        _scrollerView.delegate = self;
        [self addSubview:_scrollerView];
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake((ScreenWidth - 100)/2.0, CGRectGetHeight(_scrollerView.frame) -19, 100, 8)];
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.71 green:0.07 blue:0.07 alpha:1];
        _pageControl.backgroundColor = [UIColor clearColor];
        [_pageControl addTarget:self action:@selector(pageControlTo:) forControlEvents:UIControlEventValueChanged];
        [_scrollerView addSubview:_pageControl];
        [_scrollerView bringSubviewToFront:_pageControl];
      
        _bottomLine = [[UIView alloc] initWithFrame:CGRectZero];
        _bottomLine.backgroundColor = [UIColor colorWithHexString:@"BFBFBF"];
        
        [self addSubview:_bottomLine];
        
        //监听退出后台的按钮
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleApplicationDidEnterBackgroundActive:) name: UIApplicationDidEnterBackgroundNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleApplicationDidBecomeActiveNotification:) name:UIApplicationDidBecomeActiveNotification object:nil];

    }
    return  self;
}

- (void)handleApplicationDidEnterBackgroundActive:(NSNotification *)notification {
    [_scrollerView pauseScroll];
}

- (void)handleApplicationDidBecomeActiveNotification:(NSNotification *)notification {
    [_scrollerView resumeScrollAfterTimeInterval:kDuration];
}

- (void)pageControlTo:(UIPageControl*)sender
{
    //令UIScrollView做出相应的滑动显示
    _adviewCurrentIndex = sender.currentPage;
    [_scrollerView.iCarousel scrollToItemAtIndex: _adviewCurrentIndex animated:YES];
    
}

-(void)updateFrame
{
    _scrollerView.frame = CGRectMake(0.0,0.0, self.bounds.size.width,self.bounds.size.height);
    _pageControl.frame = _pageControl.frame;
    _bottomLine.frame = CGRectMake(0.0,self.bounds.size.height-0.5, self.window.frame.size.width, 0.5);
}

//- (void)ADViewDidClickBlock:(ADViewDidClickBlock)didClickBlock{
//    if (didClickBlock) {
//        self.adDidClickBlock = [didClickBlock copy];
//    }
//}

#pragma mark -FLLoopScrollViewDataSource

- (NSUInteger)numberOfPages
{
    return _advertisementModels.count;
}

- (UIView *)viewForPageAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    NSLog(@"生成当前飘窗的界面和数据");
    UIImageView *imageView = nil;
    if (!view)
    {
        imageView = [[UIImageView alloc] initWithFrame:
                     CGRectMake(0, 0, self.bounds.size.width,_scrollerView.bounds.size.height)];
        NSLog(@"生成CustomImageView");
    }
    else
    {
        imageView = (UIImageView*)view;
        NSLog(@"customImageView已经存在");
    }
    
//    假的数据沃只是设置了图片的字段
    if ([[self.advertisementModels objectAtIndex:index] isKindOfClass:[NSString class]])//不是字典
    {
        NSLog(@"假数据的时候");
        NSString *imageName = (NSString *)[self.advertisementModels objectAtIndex:index];
        imageView.image = [UIImage imageNamed:imageName];
        
    }else{
        //是真实的数据
//        AdvertisementInformation *advertisement = (AdvertisementInformation *)[self.advertisementModels objectAtIndex:index];
//        NSString *imageUrl = advertisement.advertisementUrl;
//        [imageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]
//                     placeholderImage:[UIImage imageNamed:@"banner_default"]
//                              options:GET_SDWEBIMAGE_OPTIONS];
        }
    
    return imageView;
}
#pragma mark -FLLoopScrollViewDelegate

- (void)currentPageIndexUpdated:(NSInteger)index
{
    //    NSLog(@"adCellView  currentPageIndexUpdated");
    _adviewCurrentIndex = index;
    [_pageControl setCurrentPage:index];
}

- (void)didSelectItemAtIndex:(NSInteger)index
{
       NSLog(@"公告View  didSelectItemAtIndex = %ld",(long)index);
    if ([[self.advertisementModels objectAtIndex:index] isKindOfClass:[NSString class]])//不是字典
    {
        //点击之后如果是默认图片 什么也不做

        return;
    }
    else
    {
//        AdvertisementInformation *advertisement = (AdvertisementInformation *)[self.advertisementModels objectAtIndex:index];
//        
//        //点击之后执行block
//        if (self.adDidClickBlock) {
//            self.adDidClickBlock(advertisement,index);
//        }
        
    }
    
}

- (void)fillData:(NSArray *)data
{
    _advertisementModels = [data copy];
    [self updateFrame];
    [_scrollerView reloadData];
    NSInteger count = [self.advertisementModels count];
    if (_adviewCurrentIndex < count)
    {
        NSLog(@"112121212121");
        [_scrollerView.iCarousel scrollToItemAtIndex: _adviewCurrentIndex animated:YES];
        [_pageControl setCurrentPage:_adviewCurrentIndex];
    }else{
        NSLog(@"112121212121------22222");

        [_scrollerView.iCarousel scrollToItemAtIndex: 0 animated:YES];
        [_pageControl setCurrentPage:0];
    }
    _scrollerView.scrollEnabled = (count > 1);
// 修改页码指示器 1 页的时候 是否显示一个点 或者不显示点  1  和零的 区别
    _pageControl.numberOfPages = count > 1 ? count : 0;
}

- (void)pageIndexChanged:(NSInteger)index
{
    NSLog(@"pageIndexChanged");
    [_pageControl setCurrentPage:index];
}

//-(void)pauseOrStartScroll:(BOOL)startOrPasuse
//{
//    if (startOrPasuse)
//    {
//        [_scrollerView resumeScrollAfterTimeInterval:kDuration];
//    }
//    else
//    {
//        [_scrollerView pauseScroll];
//
//    }
//    
//}
-(void)pauseScroll{
    
    [_scrollerView pauseScroll];

}

- (void)startScroll{
    
    [_scrollerView resumeScrollAfterTimeInterval:kDuration];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
