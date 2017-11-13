//
//  NSString+Predicate.h
//  haochang
//
//  Created by Administrator on 14-4-15.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef enum RegexType{
    isNill,
    isError,
    isRight
}RegexType;

@interface NSString (Predicate)

//验证用户名是否是7-13位
+(RegexType)ValidateUserName:(NSString *)userName withMsg:(NSString *)msg;
//验证用户密码
+(RegexType)ValidatePsw:(NSString *)psw withMsg:(NSString *)msg;
//验证用户昵称
+(RegexType)ValidateNickName:(NSString *)nickName withMsg:(NSString *)msg;

+(RegexType)ValidateUserNameDefault:(NSString *)userName withMsg:(NSString *)msg; // add tianzhu0723
//邮箱验证格式
+ (RegexType) validateEmail: (NSString *) candidate;
//电话号码限制
+ (RegexType) validateTel: (NSString *) candidate;
//只能是汉字或字母
+ (RegexType) validateCharacter:(NSString *)candidate;
//限制特殊符号
+ (RegexType) validateCharacternum:(NSString *)candidate;
//验证是否是数字
+ (RegexType)validateNumeric:(NSString *)str;
//账号不能以下划线开头
+(RegexType)isValidateUserName:(NSString *)userName withMsg:(NSString *)msg;
//验证密码
+(RegexType)isValidateUserNameDefault:(NSString *)userName withMsg:(NSString *)msg;
+(RegexType)isValidatePsw:(NSString *)psw withMsg:(NSString *)msg;
+(RegexType)isValidateBlank:(NSString*)blank;
+(RegexType)isValidateDigtal:(NSString *)blank;
//通知列表特殊类型转换。Example: 校园歌手大赛已结束，恭喜[冰花<142>]的歌曲[大城小爱<2900>]获得第一名！
//+ (NSString*)convertRegexWithText:(NSString*)text;

@end
