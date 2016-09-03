//
//  UITextField+SJ.h
//
//  Created by YeShaoJian on 14/11/7.
//  Copyright (c) 2014年 YeShaoJian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (SJ)

/**
 *  手机号码格式化
 *
 *  @param textField 需要格式化的UITextField
 *  @param range     修改的文本范围
 *  @param string    新增的字符串
 */
+ (BOOL)sj_phoneNumberFormatWithTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

/**
 *  银行卡号码格式化
 *  参数 textField 需要格式化的UITextField
 *  参数 range 修改的文本范围
 *  参数 string 新增的字符串
 */
+ (BOOL)sj_bankNumberFormatWithTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;

/**
 *  格式化后的号码转正常数字
 *
 *  @param textField 需要转换的UITextField
 */
+ (NSString *)numberToNormalNumTextField:(UITextField *)textField;

/**
 *  添加UITextField左边的图片
 *
 *  @param image 需要展示的图片
 */
- (void)sj_addLeftViewWithImage:(NSString *)image;

/**
 *  判断账号是否合法（字母开头，允许5-16字节，字母数字下划线）
 */
- (BOOL)sj_isAccountNum;

/**
 *  判断密码是否合法（字母、数字、字符组成 7 ~ 21位）
 */
- (BOOL)sj_isPassWord;

/**
 * 判断是否为手机号码
 */
- (BOOL)sj_isTelphoneNum;

/**
 *  判断是否为邮箱
 */
- (BOOL)sj_isValidateEmail;

/**
 *  判断是否为QQ
 */
- (BOOL)sj_isQQNum;

/**
 *  判断是否为邮政编码
 */
- (BOOL)sj_isPostcode;

/**
 *  判断是否为身份证号码
 */
- (BOOL)sj_isIdentityCardNum;

/**
 *  判断是否为IP地址
 */
- (BOOL)sj_isIpCity;

@end
