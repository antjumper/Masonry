//
//  MASExampleRemakeView.m
//  Masonry iOS Examples
//
//  Created by Sam Symons on 2014-06-22.
//  Copyright (c) 2014 Jonas Budelmann. All rights reserved.
//

#import "MASExampleRemakeView.h"

@interface MASExampleRemakeView ()

@property (nonatomic, strong) UIButton *movingButton;
@property (nonatomic, assign) BOOL topLeft;

- (void)toggleButtonPosition;

@end

@implementation MASExampleRemakeView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    self.movingButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.movingButton setTitle:@"Move Me!" forState:UIControlStateNormal];
    self.movingButton.layer.borderColor = UIColor.greenColor.CGColor;
    self.movingButton.layer.borderWidth = 3;
    
    [self.movingButton addTarget:self action:@selector(toggleButtonPosition) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.movingButton];
    
    self.topLeft = YES;
    
    return self;
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

// this is Apple's recommended place for adding/updating constraints
- (void)updateConstraints {
    
    // 这里使用update也是一样的。
    // remake会将之前的全部移除，然后重新添加
    [self.movingButton remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(100));
        make.height.equalTo(@(100));
        
        if (self.topLeft) {
            make.left.equalTo(self.left).with.offset(10);
            make.top.equalTo(self.top).with.offset(10);
        }
        else {
            make.bottom.equalTo(self.bottom).with.offset(-10);
            make.right.equalTo(self.right).with.offset(-10);
        }
    }];
    
    //according to apple super should be called at end of method
    [super updateConstraints];
}

- (void)toggleButtonPosition {
    self.topLeft = !self.topLeft;
    
    // 告诉self.view约束需要更新

    // tell constraints they need updating
    [self setNeedsUpdateConstraints];
    
     // 调用此方法告诉self.view检测是否需要更新约束，若需要则更新，下面添加动画效果才起作用
    // update constraints now so we can animate the change
    [self updateConstraintsIfNeeded];
    
    
    [UIView animateWithDuration:0.4 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
