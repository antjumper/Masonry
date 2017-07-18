//
//  MASExampleDistributeView.m
//  Masonry iOS Examples
//
//  Created by bibibi on 15/8/6.
//  Copyright (c) 2015年 Jonas Budelmann. All rights reserved.
//

#import "MASExampleDistributeView.h"
// 2个或2个以上的控件等间隔排序
 /**
 *  多个控件固定间隔的等间隔排列，变化的是控件的长度或者宽度值
 *
 *  @param axisType        轴线方向
 *  @param fixedSpacing    间隔大小
 *  @param leadSpacing     头部间隔
 *  @param tailSpacing     尾部间隔
 */
/*
- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType
withFixedSpacing:(CGFloat)fixedSpacing l
eadSpacing:(CGFloat)leadSpacing
tailSpacing:(CGFloat)tailSpacing;
 */

/**
 *  多个固定大小的控件的等间隔排列,变化的是间隔的空隙
 *
 *  @param axisType        轴线方向
 *  @param fixedItemLength 每个控件的固定长度或者宽度值
 *  @param leadSpacing     头部间隔
 *  @param tailSpacing     尾部间隔
 */

/*
- (void)mas_distributeViewsAlongAxis:(MASAxisType)axisType
withFixedItemLength:(CGFloat)fixedItemLength
leadSpacing:(CGFloat)leadSpacing
tailSpacing:(CGFloat)tailSpacing;

作者：码码乐趣
链接：http://www.jianshu.com/p/1d1a1165bb04
來源：简书
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

 */
@implementation MASExampleDistributeView

- (id)init {
    self = [super init];
    if (!self) return nil;

    NSMutableArray *arr = @[].mutableCopy;
    for (int i = 0; i < 4; i++) {
        UIView *view = UIView.new;
        view.backgroundColor = [self randomColor];
        view.layer.borderColor = UIColor.blackColor.CGColor;
        view.layer.borderWidth = 2;
        [self addSubview:view];
        [arr addObject:view];
    }
    
    unsigned int type  = 0;
//    arc4random()%4;
    
    NSLog(@"type = %@",@(type));
    switch (type) {
            
            
        case 0: //axisType        轴线方向  fixedSpacing    间隔大小  leadSpacing     头部间隔  tailSpacing     尾部间隔
            [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:10 leadSpacing:3 tailSpacing:3];
            [arr makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@60);
                make.height.equalTo(@60);
            }];
            break;
        case 1:
            [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:10 leadSpacing:3 tailSpacing:3];
            [arr makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@0);
                make.width.equalTo(@60);
            }];
            break;
        case 2://轴线方向         每个空间的固定长度或者宽度值   leadSpacing 头部间隔  tailSpacing 尾部间隔
            [arr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:30 leadSpacing:20 tailSpacing:20];
            [arr makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(@60);
                make.height.equalTo(@60);
            }];
            break;
        case 3:
            [arr mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedItemLength:30 leadSpacing:20 tailSpacing:20];
            [arr makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(@0);
                make.width.equalTo(@60);
            }];
            break;
            
        default:
            break;
    }
    
    return self;
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

@end
