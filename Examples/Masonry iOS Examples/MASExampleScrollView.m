//
//  MASExampleScrollView.m
//  Masonry iOS Examples
//
//  Created by Jonas Budelmann on 20/11/13.
//  Copyright (c) 2013 Jonas Budelmann. All rights reserved.
//

#import "MASExampleScrollView.h"
#import "TPKeyboardAvoidingScrollView.h"
/**
 *  UIScrollView and Auto Layout don't play very nicely together see
 *  https://developer.apple.com/library/ios/technotes/tn2154/_index.html
 *
 *  This is an example of one workaround
 *
 *  for another approach see https://github.com/bizz84/MVScrollViewAutoLayout
 */


//scrollView  不确定布局的话 那么就 先给 scrollView一个 contentView framex相等  然后根据view设置 之后设置contentView的bootom等于lastView的bottom
@interface MASExampleScrollView ()
@property (strong, nonatomic) TPKeyboardAvoidingScrollView* scrollView;
@end

@implementation MASExampleScrollView

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    TPKeyboardAvoidingScrollView *scrollView = TPKeyboardAvoidingScrollView.new;
    self.scrollView = scrollView;
    scrollView.backgroundColor = [UIColor grayColor];
    [self addSubview:scrollView];
    [self.scrollView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    [self generateContent];

    return self;
}

- (void)generateContent {
    UIView* contentView = UIView.new;
    [self.scrollView addSubview:contentView];
    
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    UIView *lastView;
    CGFloat height = 25;
    
    for (int i = 0; i < 10; i++) {
        UITextField *view = UITextField.new;
        view.backgroundColor = [self randomColor];
        [contentView addSubview:view];
        
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
        [view addGestureRecognizer:singleTap];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(lastView ? lastView.bottom : @0);
            make.left.equalTo(@0);
            make.width.equalTo(contentView.width);
            make.height.equalTo(@(height));
        }];
        
        height += 25;
        lastView = view;
    }
    
    [contentView makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.bottom);
    }];
}

- (UIColor *)randomColor {
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}

- (void)singleTap:(UITapGestureRecognizer*)sender {
    [sender.view setAlpha:sender.view.alpha / 1.20]; // To see something happen on screen when you tap :O
    [self.scrollView scrollRectToVisible:sender.view.frame animated:YES];
};

@end
