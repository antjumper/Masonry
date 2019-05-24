//
//  FLXRowView.h
//  Masonry iOS Examples
//
//  Created by 刘红波 on 2017/8/18.
//  Copyright © 2017年 Jonas Budelmann. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLXRowView : UIView

//设置的底部背景
@property (nonatomic,strong) UIImageView *bgImageView;

- (instancetype)initWithImages:(NSArray <NSString *> *)images withTitles:(NSArray<NSString *> *)titles;


- (void)didClickAtIndex:(NSInteger)index;

@end
