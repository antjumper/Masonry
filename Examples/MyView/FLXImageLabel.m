//
//  FLXImageLabel.m
//  Masonry iOS Examples
//
//  Created by 刘红波 on 2017/8/18.
//  Copyright © 2017年 Jonas Budelmann. All rights reserved.
//

#import "FLXImageLabel.h"

@implementation FLXImageLabel

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self genLayoutConstraints];
        
    }
    return self;
}

- (void)genLayoutConstraints{
    
    [self addSubview:self.imageView];
    
    [self addSubview:self.textLabel];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.width.and.centerX.equalTo(self);
    }];
    
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.width.equalTo(self);
        make.top.mas_equalTo(self.imageView.bottom).offset(6);
        
    }];
    
}


#pragma mark - UIImageView getter方法
-(UIImageView *)imageView
{
    if (_imageView == nil)
    {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor clearColor];
        _imageView.userInteractionEnabled = YES;
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageView;
}

#pragma mark - UIlabel getter方法
- (UILabel *)textLabel{
    if (_textLabel == nil) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.backgroundColor =[UIColor clearColor];
        _textLabel.numberOfLines = 0;
        _textLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0];
        _textLabel.font = [UIFont systemFontOfSize:14];
        _textLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _textLabel;
}


@end
