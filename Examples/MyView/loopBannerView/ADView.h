//
//  ADView.h
//  loanCustomer
//
//  Created by Puhui on 16/8/18.
//  Copyright © 2016年 凡普金融. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLLoopScrollView.h"
//AdvertisementInformation

//typedef void(^ADViewDidClickBlock) (AdvertisementInformation *advertisementInformation , NSInteger index);

@interface ADView : UIView

/**
 *  刷新数据的接口
 *  @param ADViewDidClickBlock  点击后执行的block
 **/

//- (void)ADViewDidClickBlock:(ADViewDidClickBlock)didClickBlock;

/**
 *  刷新数据的接口
 *  @param dataSource  传入一个数组模型 显示相应的数据
 **/

- (void)fillData:(NSArray *)dataSource;

/**
 *  刷新数据的接口
 *  暂停
 **/

-(void)pauseScroll;

/**
 *  刷新数据的接口
 *  暂停
 **/
- (void)startScroll;


@end
