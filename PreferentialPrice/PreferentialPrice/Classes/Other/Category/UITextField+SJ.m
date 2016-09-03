//
//  UITextField+SJ.m
//
//  Created by YeShaoJian on 14/11/7.
//  Copyright (c) 2014年 YeShaoJian. All rights reserved.
//

#import "UITextField+SJ.h"

@implementation UITextField (SJ)

+ (BOOL)sj_phoneNumberFormatWithTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *text = textField.text;
    // 只能输入数字
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
    // 如果是空格，就剔除空格
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound)
    {
        return NO;
    }
    
    // 取得当前格式化后的字符串
    text = [text stringByReplacingCharactersInRange:range withString:string];
    // 将空格全部替换为空（剔除空格，再后面进行处理）
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    // 如果是电话号码格式化，需要添加这三行代码
    NSMutableString *temString = [NSMutableString stringWithString:text];
    // 在第0位前插入空格
    [temString insertString:@" " atIndex:0];
    text = temString;
    
    NSString *newString = @"";
    
    while (text.length > 0)
    {
        // 截取字符串（取2个值中较小的值）
        NSString *subString = [text substringToIndex:MIN(text.length, 4)];
        // 拼接字符串
        newString = [newString stringByAppendingString:subString];
        if (subString.length == 4) {  // 如果subString长度等于4
            
            // 在字符串后面添加一个空格
            newString = [newString stringByAppendingString:@" "];
        }
        // 截取字符串（取2个值中较小的值
        text = [text substringFromIndex:MIN(text.length, 4)];
    }
    
    // 去除字符串中的特殊符号，只保留数字和中间的数字中间空格
    newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    
    if (newString.length >= 14)
    {
        return NO;
    }
    
    textField.text = newString;
    
    return NO;

}

+ (BOOL)sj_bankNumberFormatWithTextField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *text = [textField text];
    
    NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789\b"];
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    if ([string rangeOfCharacterFromSet:[characterSet invertedSet]].location != NSNotFound) {
        return NO;
    }
    
    text = [text stringByReplacingCharactersInRange:range withString:string];
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSString *newString = @"";
    while (text.length > 0) {
        NSString *subString = [text substringToIndex:MIN(text.length, 4)];
        newString = [newString stringByAppendingString:subString];
        if (subString.length == 4) {
            newString = [newString stringByAppendingString:@" "];
        }
        text = [text substringFromIndex:MIN(text.length, 4)];
    }
    
    newString = [newString stringByTrimmingCharactersInSet:[characterSet invertedSet]];
    
    if (newString.length >= 24) {
        return NO;
    }
    
    [textField setText:newString];
    
    return NO;
}

/**
 *  格式化后的号码转正常数字
 *  参数 textField UITextField控件
 */
+ (NSString *)numberToNormalNumTextField:(UITextField *)textField
{
    return [textField.text stringByReplacingOccurrencesOfString:@" " withString:@""];
}

- (void)sj_addLeftViewWithImage:(NSString *)image
{
    
    // 输入框左边图片
    UIImageView *lockIv = [[UIImageView alloc] init];
    
    // 设置尺寸
    CGRect imageBound = self.bounds;
    // 宽度高度一样
    imageBound.size.width = imageBound.size.height;
    lockIv.bounds = imageBound;
    
    // 设置图片
    lockIv.image = [UIImage sj_changeImageColorWithImageName:image size:CGSizeMake(20, 20) color:[UIColor whiteColor]];
    
    // 设置图片居中显示
    lockIv.contentMode = UIViewContentModeCenter;
    
    // 添加TextFiled的左边视图
    self.leftView = lockIv;
    
    // 设置TextField左边的总是显示
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (BOOL)sj_isAccountNum
{
    NSString *accountRegex = @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$";
    NSPredicate *accountTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", accountRegex];
    return [accountTest evaluateWithObject:self.text];
}

- (BOOL)sj_isPassWord
{
    NSString *PassWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *PassWordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PassWordRegex];
    return [PassWordTest evaluateWithObject:self.text];
}

-(BOOL)sj_isTelphoneNum
{
    
    NSString *telRegex = @"^1[3578]\\d{9}$";
    NSPredicate *prediate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegex];
    return [prediate evaluateWithObject:self.text];
}

- (BOOL)sj_isValidateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    return [emailTest evaluateWithObject:self.text];
}

- (BOOL)sj_isQQNum
{
    NSString *QQNumRegex = @"[1-9][0-9]{4,}";
    NSPredicate *QQNumTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",QQNumRegex];
    return [QQNumTest evaluateWithObject:self.text];
}

- (BOOL)sj_isPostcode
{
    NSString *PostcodeRegex = @"[1-9]\\d{5}(?!\\d)";
    NSPredicate *PostcodeTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",PostcodeRegex];
    return [PostcodeTest evaluateWithObject:self.text];
}

- (BOOL)sj_isIdentityCardNum
{
    NSString *IdentityCardRegex = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *IdentityCardTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",IdentityCardRegex];
    return [IdentityCardTest evaluateWithObject:self.text];
}

- (BOOL)sj_isIpCity
{
    NSString *IpCityRegex = @"\\d+\\.\\d+\\.\\d+\\.\\d+";
    NSPredicate *IpCityTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",IpCityRegex];
    return [IpCityTest evaluateWithObject:self.text];
}

@end
