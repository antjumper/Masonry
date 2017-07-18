//
//  MASExampleAnimatedView.m
//  Masonry iOS Examples
//
//  Created by Jonas Budelmann on 22/07/13.
//  Copyright (c) 2013 Jonas Budelmann. All rights reserved.
//

#import "MASExampleAnimatedView.h"

@interface MASExampleAnimatedView ()

@property (nonatomic, strong) NSMutableArray *animatableConstraints;
@property (nonatomic, assign) int padding;
@property (nonatomic, assign) BOOL animating;

@end

@implementation MASExampleAnimatedView

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

    UIView *blueView = UIView.new;
    blueView.backgroundColor = UIColor.blueColor;
    blueView.layer.borderColor = UIColor.blackColor.CGColor;
    blueView.layer.borderWidth = 2;
    [self addSubview:blueView];

    UIView *superview = self;
    int padding = self.padding = 10;
    UIEdgeInsets paddingInsets = UIEdgeInsetsMake(self.padding, self.padding, self.padding, self.padding);

    self.animatableConstraints = NSMutableArray.new;

    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        [self.animatableConstraints addObjectsFromArray:@[
            make.edges.equalTo(superview).insets(paddingInsets).priorityLow(),
            make.bottom.equalTo(blueView.mas_top).offset(-padding),
        ]];

        make.size.equalTo(redView);
        make.height.equalTo(blueView.mas_height);
    }];

    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        [self.animatableConstraints addObjectsFromArray:@[
            make.edges.equalTo(superview).insets(paddingInsets).priorityLow(),
            make.left.equalTo(greenView.mas_right).offset(padding),
            make.bottom.equalTo(blueView.mas_top).offset(-padding),
        ]];

        make.size.equalTo(greenView);
        make.height.equalTo(blueView.mas_height);
    }];

    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        [self.animatableConstraints addObjectsFromArray:@[
            make.edges.equalTo(superview).insets(paddingInsets).priorityLow(),//这个返回的是 MASConstraint  类型
        ]];

        make.height.equalTo(greenView.mas_height);
        make.height.equalTo(redView.mas_height);
    }];

    return self;
}
//-(void)willMoveToSuperview:(UIView *)newSuperview - 在一个子视图将要被添加到另一个视图的时候发送此消息;
//-(void)willMoveToWindow:(UIWindow *)newWindow - 在一个视图（或者它的超视图）将要被添加到window的时候发送;
//-(void)didMoveToSuperview - 把一个视图插入到视图层级之后发送此消息;
//-(void)didMoveToWindow - 当视图获得它的window属性集的时候发送此消息.
- (void)didMoveToWindow {
    [self layoutIfNeeded];

    if (self.window) {
        self.animating = YES;
        [self animateWithInvertedInsets:NO];
    }
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    self.animating = newWindow != nil;
}

- (void)animateWithInvertedInsets:(BOOL)invertedInsets {
    if (!self.animating) return;

    int padding = invertedInsets ? 100 : self.padding;
    UIEdgeInsets paddingInsets = UIEdgeInsetsMake(padding, padding, padding, padding);
    for (MASConstraint *constraint in self.animatableConstraints) {
        constraint.insets = paddingInsets;
    }

    [UIView animateWithDuration:1 animations:^{
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        //repeat!
        [self animateWithInvertedInsets:!invertedInsets];
    }];
}


@end

