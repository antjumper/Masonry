//
//  MASExampleBasicView.m
//  Masonry
//
//  Created by Jonas Budelmann on 21/07/13.
//  Copyright (c) 2013 cloudling. All rights reserved.
//

#import "MASExampleBasicView.h"
#import "FLXRowView.h"
@implementation MASExampleBasicView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    UIView *greenView = UIView.new;
    greenView.backgroundColor = UIColor.greenColor;
    greenView.layer.borderColor = UIColor.blackColor.CGColor;
    greenView.layer.borderWidth = 2;
    [self addSubview:greenView];
    
    UIView *redView = UIView.new;
    redView.backgroundColor = UIColor.redColor;
    redView.layer.borderColor = UIColor.blackColor.CGColor;
    redView.layer.borderWidth = 2;
    [self addSubview:redView];
    
//    UIView *blueView = UIView.new;
//    blueView.backgroundColor = UIColor.blueColor;
//    blueView.layer.borderColor = UIColor.blackColor.CGColor;
//    blueView.layer.borderWidth = 2;
//    [self addSubview:blueView];
//    
//    int padding = 10;

    
   
//    
//    //offset 左偏移是负  右偏移是正
//    //if you want to use Masonry without the mas_ prefix
//    //define MAS_SHORTHAND before importing Masonry.h see Masonry iOS Examples-Prefix.pch
//    [greenView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.greaterThanOrEqualTo(superview.top).offset(padding);
//        make.left.equalTo(superview.left).offset(padding);
////        make.bottom.equalTo(blueView.top).offset(-padding);
//        make.bottom.equalTo(superview.top).offset(-padding);
//
//        make.right.equalTo(redView.left).offset(-padding);
//
//        make.width.equalTo(redView.width);
//        
//        make.height.equalTo(redView.height);
////        make.height.equalTo(blueView.height);
//        
//        make.height.equalTo(superview.height);
//
//        
//    }];
//    
//    //with is semantic and option
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(superview.mas_top).with.offset(padding); //with with
//        make.left.equalTo(greenView.mas_right).offset(padding); //without with
////        make.bottom.equalTo(blueView.mas_top).offset(-padding);
//        make.bottom.equalTo(superview.mas_top).offset(-padding);
//
//        make.right.equalTo(superview.mas_right).offset(-padding);
//        make.width.equalTo(greenView.mas_width);
//        
////        make.height.equalTo(@[greenView, blueView]); //can pass array of views
//        make.height.equalTo(@[superview, blueView]); //can pass array of views
//
//    }];
//
//    
   
//    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[greenView, redView]];
//    stackView.translatesAutoresizingMaskIntoConstraints = NO;
//    stackView.axis = UILayoutConstraintAxisHorizontal;
//    stackView.distribution = UIStackViewDistributionFill;
//    stackView.alignment = UIStackViewAlignmentCenter;
//    stackView.backgroundColor = [UIColor yellowColor];
//    [self addSubview:stackView];
    
//    UIView *stackView = UIView.new;
//    stackView.backgroundColor = [UIColor yellowColor];
//    stackView.layer.borderColor = UIColor.blackColor.CGColor;
//    stackView.layer.borderWidth = 2;
//    [self addSubview:stackView];
//    
//    [stackView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.greaterThanOrEqualTo(superview.top).offset(padding);
//        make.left.equalTo(superview.left).offset(padding);
//        //        make.bottom.equalTo(blueView.top).offset(-padding);
//        make.right.equalTo(superview.right).offset(-padding);
//        //        make.width.equalTo(superview.width);
//        
//        //        make.height.equalTo(redView.height);
//        //        make.height.equalTo(blueView.height);
//        
//    }];

//    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(greenView.mas_bottom).offset(padding);
//        make.top.equalTo(stackView.mas_bottom).offset(padding);
//
//        make.left.equalTo(superview.mas_left).offset(padding);
//        
//        make.bottom.equalTo(superview.mas_bottom).offset(-padding);
//        make.right.equalTo(superview.mas_right).offset(-padding);
////        make.height.equalTo(@[greenView.mas_height, redView.mas_height]); //can pass array of attributes
//        make.height.equalTo(stackView.height); //can pass array of attributes
//
//    }];
    
    __weak typeof(self) weakSelf = self;
    
    // 初始化黑色view
//    UIView *blackView = [UIView new];
//    blackView.backgroundColor = [UIColor blackColor];
//    [self addSubview:blackView];
    
    
//    UIStackView *stackView = [[UIStackView alloc] initWithArrangedSubviews:@[greenView, redView]];
//    stackView.translatesAutoresizingMaskIntoConstraints = NO;
//    stackView.axis = UILayoutConstraintAxisHorizontal;
//    stackView.distribution = UIStackViewDistributionFill;
//    stackView.alignment = UIStackViewAlignmentCenter;
//    stackView.backgroundColor = [UIColor yellowColor];
//    [self addSubview:stackView];
//    // 给黑色view添加约束
//    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        // 添加左、上边距约束
//        make.left.and.top.mas_equalTo(10);
//        // 添加右边距约束
//        make.right.mas_equalTo(-10);
//    }];
//    
//    
//    
//    //offset 左偏移是负  右偏移是正
//    //if you want to use Masonry without the mas_ prefix
//    //define MAS_SHORTHAND before importing Masonry.h see Masonry iOS Examples-Prefix.pch
//    [greenView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.greaterThanOrEqualTo(stackView.top).offset(padding);
//        make.left.equalTo(stackView.left).offset(padding);
//        //        make.bottom.equalTo(blueView.top).offset(-padding);
//        make.bottom.equalTo(redView.top).offset(-padding);
//        
//        make.right.equalTo(redView.left).offset(-padding);
////
//        make.width.equalTo(redView.width);
//        
////        make.height.equalTo(redView.height);
//        //        make.height.equalTo(blueView.height);
//        
//        make.height.equalTo(redView.height);
//        
//        
//    }];
//    
//    //with is semantic and option
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(stackView.mas_top).with.offset(padding); //with with
//        make.left.equalTo(redView.mas_right).offset(padding); //without with
//        //        make.bottom.equalTo(blueView.mas_top).offset(-padding);
//        make.bottom.equalTo(stackView.bottom).offset(-padding);
//        
//        make.right.equalTo(stackView.mas_right).offset(-padding);
//        make.width.equalTo(redView.mas_width);
//        
//        //        make.height.equalTo(@[greenView, blueView]); //can pass array of views
//        make.height.equalTo(redView.height); //can pass array of views
//        
//    }];
//    
//    
//    redView.hidden = YES;
//    
//    // 初始化灰色view
//    UIView *grayView = [UIView new];
//    grayView.backgroundColor = [UIColor lightGrayColor];
//    [self addSubview:grayView];
//    
//    // 给灰色view添加约束
//    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        // 添加右、下边距约束
//        make.bottom.and.right.mas_equalTo(-20);
//        // 添加高度约束，让高度等于黑色view
//        make.height.equalTo(stackView);
//        // 添加上边距约束（上边距 = 黑色view的下边框 + 偏移量20）
//        make.top.equalTo(stackView.mas_bottom).offset(20);
//        // 添加左边距（左边距 = 父容器纵轴横轴中心 + 偏移量0）
//        make.left.equalTo(weakSelf.mas_centerX).offset(0);
//    }];
    
//------------------------------测试-------------------------------------------------//
    /*
    //测试
    //测试 ContentHuggingPriority [topView setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisVertical];
//   ContentCompressionResistance  [rightLabel setContentCompressionResistancePriority:751 forAxis:UILayoutConstraintAxisHorizontal];
    
//    http://www.cocoachina.com/ios/20160229/15455.html?utm_source=tuicool&utm_medium=referral
    UIImageView *imageV = [[UIImageView alloc] init];
    imageV.backgroundColor = [UIColor redColor];
    imageV.contentMode = UIViewContentModeScaleAspectFit;
    
    [self addSubview:imageV];
    imageV.image = [UIImage imageNamed:@"homepage_icon_fast"];
    [imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
//        make.width.mas_equalTo(10);
//        make.height.mas_equalTo(10);

    }];
   
    UILabel *label = [[UILabel alloc] init];
    [self addSubview:label];

    label.backgroundColor = [UIColor yellowColor];
    label.text = @"你好你好";
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageV.mas_bottom).offset(5);
        make.left.equalTo(imageV.mas_left);
        make.width.mas_equalTo(imageV.width);
        
    }];
    
    label.text = @"a";
     
     */
    //------------------------------测试结束-------------------------------------------------//
    
    FLXRowView *rowView = [[FLXRowView alloc] initWithImages:@[@"homepage_icon_fast",@"homepage_icon_fast",@"homepage_icon_fast"] withTitles:@[@"测试结束",@"测试结束",@"测试结束"]];
    [self addSubview:rowView];
    [rowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0); //with with
        make.left.equalTo(self.mas_right).offset(0); //without with
        
        make.right.equalTo(self.mas_right).offset(0);
        make.width.equalTo(self.mas_width);
        make.height.mas_equalTo(180);
        

    }];

    return self;
}

@end
