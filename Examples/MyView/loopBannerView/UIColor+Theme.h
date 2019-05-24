//
//  UIColor+Theme.h
//  loanCustomer
//
//  Created by zhangyinglong on 15/2/10.
//  Copyright (c) 2015年 凡普金融. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIColor (Theme)

+ (UIColor *)colorWithHex:(NSInteger)hex;

+ (UIColor*)colorWithHexString:(NSString*)hex;

+ (UIColor *)getColorWithR0G183B172;

+ (UIColor *)getColorWithR51G51B51;

+ (UIColor *)getColorWithR76G76B76;

+ (UIColor *)getColorWithR89G89B89;

+ (UIColor *)getColorWithR102G102B102;

+ (UIColor *)getColorWithR127G127B127;

+ (UIColor *)getColorWithR154G154B154;

+ (UIColor *)getColorWithR236G231B227;

+ (UIColor *)getColorWithR252G115B108;

+ (UIColor *)getColorWithR163G221B216;

+ (UIColor *)getColorWithR176G163B150;

// 未读消息气泡
+ (UIColor *)getColorWithR250G50B50;

+ (UIColor *)getColorWithR157G21B30;

+ (UIColor *)getColorWithR189G189B189;

+ (UIColor *)getColorWithR241G241B241;

+ (UIColor *)getColorWithR242G48B48;
// 页面背景
+ (UIColor *)getColorWithR245G245B245;

+ (UIColor *)getColorWithR246G151B0;

// 导航栏背景
+ (UIColor *)getColorWithR249G249B249;

// 条目按下状态
+ (UIColor *)getColorWithR236G236B236;

// 线的颜色
+ (UIColor *)getColorWithR209G209B209;

// 输入框中间的间隔线
+ (UIColor *)getColorWithR230G230B230;

// 通知栏背景色
+ (UIColor *)getColorWithR229G232B239;

//个人信息录入/联系人信息录入  顶部View背景色
+ (UIColor *)getColorWithR234G234B234;

//红框按钮高亮的颜色值
+ (UIColor *)getColorWithR221G115B120;

+ (UIColor *)getColorWithR211G218B226;

+ (UIColor *)getColorWithR223G224B224;

/// ==================================
//每个页面的背景色
+ (UIColor *)viewControllerBackgroundColor;

// 导航栏背景色
+ (UIColor *)navigateBarBackgroudColor;

// 导航栏标题文字颜色
+ (UIColor *)navigateBarTitleColor;

// 账户view背景颜色
+ (UIColor *)accoutViewBackgroudColor;

// 表单左边提示文字颜色(未编辑状态下)
+ (UIColor *)formLeftTitleNormalColor;

// 表单左边提示文字颜色(编辑状态下)
+ (UIColor *)formLeftTitleEditingColor;

// 表单编辑框 placeholder 文字颜色
+ (UIColor *)formTextFieldPlaceholderColor;

// 消息气泡 等突出强调信息的颜色
+ (UIColor *)messageBubbleColor;

// 可点击文字颜色
+ (UIColor *)superLinkTitleColor;

// 质检通过 颜色
+ (UIColor *)QACheckSuccessedColor;

// 设置页面 条目颜色
+ (UIColor *)settingRightTitleColor;

/*
    红色背景 的按钮
 */
// 按钮标题文字颜色(正常状态)
+ (UIColor *)button1TitleNormalColor;

// 按钮标题文字颜色(按下状态)
+ (UIColor *)button1TitleHighlightColor;

// 按钮标题文字颜色(不可用状态)
+ (UIColor *)button1TitleDisableColor;

// 按钮背景颜色(正常状态)
+ (UIColor *)button1BackgroundNormalColor;

// 按钮背景颜色(按下状态)
+ (UIColor *)button1BackgroundHighlightColor;

// 按钮背景颜色(不可用状态)
+ (UIColor *)button1BackgroundDisableColor;

/*
 绿色背景 的按钮
 */
// 按钮标题文字颜色(正常状态)
+ (UIColor *)button2TitleNormalColor;

// 按钮标题文字颜色(按下状态)
+ (UIColor *)button2TitleHighlightColor;

// 按钮标题文字颜色(不可用状态)
+ (UIColor *)button2TitleDisableColor;

// 按钮背景颜色(正常状态)
+ (UIColor *)button2BackgroundNormalColor;

// 按钮背景颜色(按下状态)
+ (UIColor *)button2BackgroundHighlightColor;

// 按钮背景颜色(不可用状态)
+ (UIColor *)button2BackgroundDisableColor;

//======9.10=========//

//联系人信息 按钮文字的颜色
+ (UIColor *)linkManButtonTextColor;

//联系人信息 按钮点击后的背景颜色
+ (UIColor *)linkManButtonSelecetBackgroundColor;

//联系人信息 按钮未点击后的背景颜色
+ (UIColor *)linkManButtonBackgroundColor;

//=======9.10=========//
//身份信息
// 按钮点击后的字体颜色 和进度条颜色
+ (UIColor *)idCardHeaderButtonSelecetAndLayerColor;

// 按钮未点击后的字体颜色
+ (UIColor *)idCardHeaderButtonTextColor;

// 背景layer默认颜色
+ (UIColor *)idCardHeaderButtonLayerBackgroundColor;

// ========9.14 ==========//
//申请借款
//itmes 右上角的左边的文字颜色
+ (UIColor *)applyLoanItmesLeftlableTextColor;

//itmes 右上角的右边的文字颜色
+ (UIColor *)applyLoanItmesRightlableTextColor;

//=========9.15========

//客服经理标签的背景颜色

+ (UIColor *)accountLable1BackgroundColor;
+ (UIColor *)accountLable2BackgroundColor;
+ (UIColor *)accountLable3BackgroundColor;
+ (UIColor *)accountLable4BackgroundColor;
+ (UIColor *)accountLable5BackgroundColor;



+ (UIColor *)productNameBackgroundColor;

///主色 1.1
+ (UIColor *)main_normalColor;

+ (UIColor *)main_disableColor;

+ (UIColor *)main_selectedColor;

///副色 1.2
+ (UIColor *)secondary_normalColor;

+ (UIColor *)secondary_disableColor;

+ (UIColor *)secondary_selectedColor;

///alterColor

+ (UIColor *)alter_redColor;

+ (UIColor *)alter_yellowColor;


///文本颜色

+ (UIColor *)text_deepColor;

+ (UIColor *)text_lightDeepColor;

+ (UIColor *)text_lowDeepColor;

///灰度图片色
+ (UIColor *)gray_deepColorColor;

+ (UIColor *)gray_lightDeepColor;

+ (UIColor *)gray_lowDeepdColor;

///分割线颜色

+ (UIColor *)separate_externalColor;

+ (UIColor *)gray_internalColor;

///底色

+ (UIColor *)standard_backgroundColor;




@end
