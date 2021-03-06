//
//  UIColor+Theme.m
//  loanCustomer
//
//  Created by zhangyinglong on 15/2/10.
//  Copyright (c) 2015年 凡普金融. All rights reserved.
//

#import "UIColor+Theme.h"

#define TT_FIX_CATEGORY_BUG(name) @interface TT_FIX_CATEGORY_BUG_##name @end \
@implementation TT_FIX_CATEGORY_BUG_##name @end

//#define CREATECOLOR(r,g,b,a)        [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

@implementation UIColor (Theme)

+ (UIColor *)colorWithHex:(NSInteger)hex {
    NSInteger r = (hex >> 16) & 255;
    NSInteger g = (hex >> 8) & 255;
    NSInteger b = hex & 255;
    
    CGFloat rf = (CGFloat)r / 255.0f;
    CGFloat gf = (CGFloat)g / 255.0f;
    CGFloat bf = (CGFloat)b / 255.0f;
    
    return CREATECOLOR(rf, gf, bf, 1.0);
}

+ (UIColor*)colorWithHexString:(NSString*)hex {
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];

    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];

    if ([cString length] != 6) return  [UIColor grayColor];

    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];

    range.location = 2;
    NSString *gString = [cString substringWithRange:range];

    range.location = 4;
    NSString *bString = [cString substringWithRange:range];

    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];

    return CREATECOLOR(r, g, b, 1.0f);
}

+ (UIColor *)getColorWithR0G183B172 {
    return CREATECOLOR(0, 183, 172, 1);
}

+ (UIColor *)getColorWithR51G51B51 {
    return CREATECOLOR(51, 51, 51, 1);
}

+ (UIColor *)getColorWithR76G76B76 {
    return CREATECOLOR(76, 76, 76, 1);
}

+ (UIColor *)getColorWithR89G89B89 {
    return CREATECOLOR(89, 89, 89, 1);
}

+ (UIColor *)getColorWithR102G102B102 {
    return CREATECOLOR(102, 102, 102, 1);
}

+ (UIColor *)getColorWithR127G127B127 {
    return CREATECOLOR(127, 127, 127, 1);
}

+ (UIColor *)getColorWithR154G154B154 {
    return CREATECOLOR(154, 154, 154, 1);
}

+ (UIColor *)getColorWithR236G231B227 {
    return CREATECOLOR(236, 231, 227, 1);
}

+ (UIColor *)getColorWithR252G115B108 {
    return CREATECOLOR(252, 115, 108, 1);
}

+ (UIColor *)getColorWithR163G221B216 {
    return CREATECOLOR(163, 221, 216, 1);
}

+ (UIColor *)getColorWithR176G163B150 {
    return CREATECOLOR(176, 163, 150, 1);
}

+ (UIColor *)getColorWithR250G50B50 {
    return CREATECOLOR(250, 50, 50, 1);
}

+ (UIColor *)getColorWithR157G21B30 {
    return CREATECOLOR(157, 21, 30, 1);
}

+ (UIColor *)getColorWithR189G189B189 {
    return CREATECOLOR(189, 189, 189, 1);
}

+ (UIColor *)getColorWithR241G241B241 {
    return CREATECOLOR(241, 241, 241, 1);
}

+ (UIColor *)getColorWithR242G48B48 {
    return CREATECOLOR(242, 48, 48, 1);
}

// 页面背景
+ (UIColor *)getColorWithR245G245B245 {
    return CREATECOLOR(245, 245, 245, 1);
}

+ (UIColor *)getColorWithR246G151B0 {
    return CREATECOLOR(246, 151, 0, 1);
}

// 导航栏
+ (UIColor *)getColorWithR249G249B249 {
    return CREATECOLOR(249, 249, 249, 1);
}

// 条目按下状态
+ (UIColor *)getColorWithR236G236B236 {
    return CREATECOLOR(236, 236, 236, 1);
}

+ (UIColor *)getColorWithR209G209B209 {
    return CREATECOLOR(209, 209, 209, 1);
}

// 输入框中间的间隔线
+ (UIColor *)getColorWithR230G230B230 {
    return CREATECOLOR(230, 230, 230, 1);
}

// 通知栏背景色
+ (UIColor *)getColorWithR229G232B239 {
    return CREATECOLOR(229, 232, 239, 1);
}

//个人信息录入/联系人信息录入  顶部View背景色
+ (UIColor *)getColorWithR234G234B234 {
    return CREATECOLOR(234, 234, 234, 1);
}

//红框按钮高亮的颜色值
+ (UIColor *)getColorWithR221G115B120 {
    return CREATECOLOR(221, 115, 120, 1);
}

+ (UIColor *)getColorWithR211G218B226 {
    return CREATECOLOR(211, 218, 226, 1);
}

+ (UIColor *)getColorWithR223G224B224 {
    return CREATECOLOR(223, 224, 224, 1);
}

/// ========================================
//每个页面的背景色
+ (UIColor *)viewControllerBackgroundColor {
//    return CREATECOLOR(241, 241, 241, 1);
    return [UIColor colorWithHexString:@"f1f1f1"];
 
}

// 导航栏背景色
+ (UIColor *)navigateBarBackgroudColor {
    return CREATECOLOR(43, 60, 76, 1);
}

// 导航栏标题文字颜色
+ (UIColor *)navigateBarTitleColor {
    return CREATECOLOR(233, 241, 243, 1);
}

// 账户view背景颜色
+ (UIColor *)accoutViewBackgroudColor {
    return CREATECOLOR(76, 169, 156, 0.9);
}

// 表单左边提示文字颜色(未编辑状态下)
+ (UIColor *)formLeftTitleNormalColor {
    return CREATECOLOR(25, 46, 84, 1);
}

// 表单左边提示文字颜色(编辑状态下)
+ (UIColor *)formLeftTitleEditingColor {
    return CREATECOLOR(113, 127, 165, 1);
}

// 表单编辑框 placeholder 文字颜色
+ (UIColor *)formTextFieldPlaceholderColor {
    return CREATECOLOR(190, 201, 212, 1);
}

// 消息气泡 等突出强调信息的颜色
+ (UIColor *)messageBubbleColor {
    return CREATECOLOR(198, 22, 30, 1);
}

// 可点击文字颜色
+ (UIColor *)superLinkTitleColor {
   return CREATECOLOR(4, 110, 208, 1);
}

// 质检通过 颜色
+ (UIColor *)QACheckSuccessedColor {
    return CREATECOLOR(69, 170, 156, 1);
}

// 设置页面 条目颜色
+ (UIColor *)settingRightTitleColor {
    return CREATECOLOR(145, 162, 183, 1);
}

/*
 红色背景 的按钮
 */
// 按钮标题文字颜色(正常状态)
+ (UIColor *)button1TitleNormalColor {
    return CREATECOLOR(255, 255, 255, 1);
}

// 按钮标题文字颜色(按下状态)
+ (UIColor *)button1TitleHighlightColor {
    return CREATECOLOR(255, 255, 255, 1);
}

// 按钮标题文字颜色(不可用状态)
+ (UIColor *)button1TitleDisableColor {
    return CREATECOLOR(255, 255, 255, 1);
}

// 按钮背景颜色(正常状态)
+ (UIColor *)button1BackgroundNormalColor {
    return CREATECOLOR(198, 22, 30, 1);
}

// 按钮背景颜色(按下状态)
+ (UIColor *)button1BackgroundHighlightColor {
    return CREATECOLOR(159, 18, 24, 1);
}

// 按钮背景颜色(不可用状态)
+ (UIColor *)button1BackgroundDisableColor {
    return CREATECOLOR(198, 22, 30, 1);
}

/*
 绿色背景 的按钮
 */
// 按钮标题文字颜色(正常状态)
+ (UIColor *)button2TitleNormalColor {
    return CREATECOLOR(255, 255, 255, 1);
}

// 按钮标题文字颜色(按下状态)
+ (UIColor *)button2TitleHighlightColor {
//    return CREATECOLOR(174, 200, 196, 1);
    return [UIColor colorWithWhite:1.0f alpha:0.5f];

}

// 按钮标题文字颜色(不可用状态)
+ (UIColor *)button2TitleDisableColor {
//    return CREATECOLOR(141, 198, 189, 1);
    return [UIColor colorWithWhite:1.0f alpha:0.5f];

}

// 按钮背景颜色(正常状态)
+ (UIColor *)button2BackgroundNormalColor {
//    return CREATECOLOR(69, 170, 156, 1);
    return [[self class] main_normalColor];
}

// 按钮背景颜色(按下状态)
+ (UIColor *)button2BackgroundHighlightColor {
//    return CREATECOLOR(53, 133, 122, 1);
   return  [[self class] main_selectedColor];
}

// 按钮背景颜色(不可用状态)
+ (UIColor *)button2BackgroundDisableColor {
//    return CREATECOLOR(69, 170, 156, 1);
    return  [[self class] main_disableColor];

}



//联系人信息 按钮文字的颜色
+ (UIColor *)linkManButtonTextColor {
    return CREATECOLOR(0, 108, 93, 1);
}
//联系人信息 钮点击后的背景颜色
+ (UIColor *)linkManButtonSelecetBackgroundColor {
    return CREATECOLOR(248, 248, 227, 1);
}
//联系人信息 按钮未点击后的背景颜色
+ (UIColor *)linkManButtonBackgroundColor {
     return CREATECOLOR(246, 255, 254, 1);
}

//身份信息
// 按钮点击后的字体颜色 和进度条颜色
+ (UIColor *)idCardHeaderButtonSelecetAndLayerColor {
 return CREATECOLOR(69, 231, 208, 1);
}

// 按钮未点击后的字体颜色
+ (UIColor *)idCardHeaderButtonTextColor {
    return CREATECOLOR(145, 162, 183, 1);
}

// 背景layer默认颜色
+ (UIColor *)idCardHeaderButtonLayerBackgroundColor {
    return CREATECOLOR(130, 170, 183, 1);
}

//申请借款
//itmes 右上角的左边的文字颜色
+ (UIColor *)applyLoanItmesLeftlableTextColor {
   return CREATECOLOR(173, 189, 134, 1);
}

//itmes 右上角的右边的文字颜色
+ (UIColor *)applyLoanItmesRightlableTextColor {
   return CREATECOLOR(141, 183, 185, 1);
}


//客服经理标签的背景颜色

+ (UIColor *)accountLable1BackgroundColor {
   return CREATECOLOR(75, 137, 220, 1);
}

+ (UIColor *)accountLable2BackgroundColor {
   return CREATECOLOR(59, 174, 218, 1);
}

+ (UIColor *)accountLable3BackgroundColor {
    return CREATECOLOR(54, 188, 155, 1);
}

+ (UIColor *)accountLable4BackgroundColor {
    return CREATECOLOR(140, 192, 81, 1);
}

+ (UIColor *)accountLable5BackgroundColor {
   return CREATECOLOR(246, 187, 67, 1);
}

//

+ (UIColor *)productNameBackgroundColor {
    return CREATECOLOR(245, 167, 64, 1);
}

///主色 1.1
+ (UIColor *)main_normalColor{
    return [UIColor colorWithHexString:@"00b8ad"];
}

+ (UIColor *)main_disableColor{
    return [UIColor colorWithHexString:@"25d0c5"];

}

+ (UIColor *)main_selectedColor{
    return [UIColor colorWithHexString:@"1daaa1"];

}

///副色 1.2
+ (UIColor *)secondary_normalColor{
    return [UIColor colorWithHexString:@"0076ff"];

}

+ (UIColor *)secondary_disableColor{
    return [UIColor colorWithHexString:@"4eb9fc"];

}

+ (UIColor *)secondary_selectedColor{
    return [UIColor colorWithHexString:@"1b9efc"];

}

///alterColor

+ (UIColor *)alter_redColor{
    return [UIColor colorWithHexString:@"ff5900"];

}

+ (UIColor *)alter_yellowColor{
    return [UIColor colorWithHexString:@"ffc64e"];

}


///文本颜色

+ (UIColor *)text_deepColor{
    return [UIColor colorWithHexString:@"333333"];

}

+ (UIColor *)text_lightDeepColor{
    return [UIColor colorWithHexString:@"666666"];

}

+ (UIColor *)text_lowDeepColor{
    return [UIColor colorWithHexString:@"999999"];

}

///灰度图片色
+ (UIColor *)gray_deepColorColor{
    return [UIColor colorWithHexString:@"666666"];

}

+ (UIColor *)gray_lightDeepColor{
    return [UIColor colorWithHexString:@"999999"];

}

+ (UIColor *)gray_lowDeepdColor{
    return [UIColor colorWithHexString:@"cecece"];

}

///分割线颜色

+ (UIColor *)separate_externalColor{
    return [UIColor colorWithHexString:@"d4d4d4"];

}

+ (UIColor *)gray_internalColor{
    return [UIColor colorWithHexString:@"e5e5e5"];

}

///底色

+ (UIColor *)standard_backgroundColor{
    return [UIColor colorWithHexString:@"f1f1f1"];

}



@end
