//
//  FLXRowView.m
//  Masonry iOS Examples
//
//  Created by 刘红波 on 2017/8/18.
//  Copyright © 2017年 Jonas Budelmann. All rights reserved.
//

#import "FLXRowView.h"
#import "FLXImageLabel.h"

@interface FLXRowView ()

@property (nonatomic,strong) NSMutableArray *views;

@property (nonatomic,strong) NSArray <NSString *>  *imageNames;

@property (nonatomic,strong) NSArray <NSString *>  *labelTexts;

@end

@implementation FLXRowView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self genLayoutConstraints];
    }
    return self;
}
- (instancetype)initWithImages:(NSArray <NSString *> *)images withTitles:(NSArray<NSString *> *)titles{
    
    self = [self init];
    if (self) {
        //设置相应的图片和文本的文字

        NSAssert(titles.count == images.count, @"FLXRowView 初始化图片数量和文本数量不对应！请检查");
        
        self.imageNames = images;
        self.labelTexts = titles;
        
        [self genImageLabelViews];
        
    }
    return self;
    
}

- (void)genImageLabelViews{
    
    self.views = [NSMutableArray array];
    
    UIStackView *stackView = [[UIStackView alloc] init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.alignment = UIStackViewAlignmentCenter;
    [self addSubview:stackView];
    
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.top.and.bottom.equalTo(self.bgImageView);
    }];
    
    [self.imageNames enumerateObjectsUsingBlock:^(NSString * _Nonnull imageName, NSUInteger idx, BOOL * _Nonnull stop) {
        
        FLXImageLabel *imageLabel = [[FLXImageLabel alloc] init];
        
//        [self addSubview:imageLabel];
        
        [self.views addObject:imageLabel];
        
        imageLabel.backgroundColor = [UIColor whiteColor];
        imageLabel.imageView.image = [UIImage imageNamed:imageName];
        imageLabel.textLabel.text = self.labelTexts[idx];
        NSLog(@"self.labelTexts[idx] = %@",self.labelTexts[idx]);
        
//        [imageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//            
//            
//            
//        }];
        
        [stackView addArrangedSubview:imageLabel];
        
        
        
        
    }];
    
    
    
}

//生成背景图片的约束
- (void)genLayoutConstraints{
    [self addSubview:self.bgImageView];
    
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.right.and.bottom.equalTo(self);
    }];
    


    
}

#pragma mark - lazy方法

- (UIImageView *)bgImageView{
    if (_bgImageView == nil) {
        _bgImageView = [[UIImageView alloc] init];
        _bgImageView.backgroundColor = [UIColor whiteColor];
    }
    return _bgImageView;
}

- (void)didClickAtIndex:(NSInteger)index{
    //点击了第几行
    NSLog(@"点击了第几个 %@",@(index));
}


@end
