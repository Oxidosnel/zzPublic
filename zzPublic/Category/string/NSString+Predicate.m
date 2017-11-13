//
//  NSString+Predicate.m
//  haochang
//
//  Created by Administrator on 14-4-15.
//  Copyright (c) 2014年 Administrator. All rights reserved.
//

#import "NSString+Predicate.h"


@implementation NSString (Predicate)

+(RegexType)ValidateUserName:(NSString *)userName withMsg:(NSString *)msg{
    if (userName == nil || [userName isEqualToString:@""]) {
        return isNill;
    }
    //    NSString *regex = @"^[a-z,A-Z,@,-,0-9]{5,16}$";
    NSString *regex = @"^[a-z,A-Z][a-z,A-Z,@,-,0-9]{7,13}$"; // change tianzhu0719
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([test evaluateWithObject:userName]) {
        return isRight;
    }else{
        return isError;
    }
}


+(RegexType)isValidateUserName:(NSString *)userName withMsg:(NSString *)msg{
    if (userName == nil || [userName isEqualToString:@""]) {
        return isNill;
    }
    //    NSString *regex = @"^[a-z,A-Z,@,-,0-9]{5,16}$";
    
    NSString *regex = @"^[a-z,A-Z][a-z,A-Z,0-9,_]{1,13}$"; // change tianzhu0719
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([test evaluateWithObject:userName]) {
        return isRight;
    }else{
        return isError;
    }
}

+(RegexType)isValidateDigtal:(NSString *)blank{
    if (blank == nil || [blank isEqualToString:@""]) {
        return isNill;
    }
    NSString *regex = @"^\\d{0,10}$"; // change tianzhu0719
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([test evaluateWithObject:blank]) {
        return isError;
    }else{
        return isRight;
    }
}

+(RegexType)ValidatePsw:(NSString *)psw withMsg:(NSString *)msg{
    if (psw == nil || [psw isEqualToString:@""]) {
        return isNill;
    }
    NSString *regex = @"^[a-z,A-Z,@,-,0-9]{6,14}$"; //change tianzhu0719
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([test evaluateWithObject:psw]) {
        return isRight;
    }else{
        
        return isError;
    }
    
}
+(RegexType)ValidateNickName:(NSString *)nickName withMsg:(NSString *)msg{
    if (nickName == nil || [nickName isEqualToString:@""]) {
        return isNill;
    }
    //    NSString *regex = @"^[a-z,A-Z,@,-,0-9]{5,16}$";
    NSString *regex = @"^[a-z,A-Z,/\u4e00-\u9fa5][a-z,A-Z,@,-,0-9,/\u4e00-\u9fa5]{1,6}$"; // change tianzhu0719
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([test evaluateWithObject:nickName]) {
        return isRight;
    }else{
        return isError;
    }
}

+(RegexType)ValidateUserNameDefault:(NSString *)userName withMsg:(NSString *)msg
{
    if (userName == nil || [userName isEqualToString:@""]) {
        return isNill;
    }
    //    NSString *regex = @"^[a-z,A-Z,@,-,0-9]{5,16}$";
    NSString *regex = @"^[a-z,A-Z,@,-,0-9]{8,14}$"; // change tianzhu0719
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([test evaluateWithObject:userName]) {
        return isRight;
    }else{
        return isError;
    }
}
#pragma mark validateEmail
+ (RegexType) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
	if ([emailTest evaluateWithObject:candidate]) {
        return isRight;
    }else{
        return isError;
    }
}
#pragma mark validateTel
+ (RegexType) validateTel: (NSString *) candidate {
    //NSString *telRegex = @"^1[358]\\d{9}$";
    NSString *telRegex = @"1\\d{10}";
    NSPredicate *telTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", telRegex];
	if ([telTest evaluateWithObject:candidate]) {
        return isRight;
    }else{
        return isError;
    }
}
#pragma mark character  //限制输入汉子或字母
+(RegexType) validateCharacter:(NSString *)candidate{
    NSString *characterRegex=@"^[\u4E00-\u9FA5A-Za-z_]+$";
    NSPredicate *characterTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",characterRegex];
    if ([characterTest evaluateWithObject:candidate]) {
        return isRight;
    }else{
        return isError;
    }
}
+ (RegexType) validateCharacternum:(NSString *)candidate;{
    NSString *characterRegex=@"^[-\u4E00-\u9FA5A-Za-z-\\d-]+$";
    NSPredicate *characterTest=[NSPredicate predicateWithFormat:@"SELF MATCHES %@",characterRegex];
    if ([characterTest evaluateWithObject:candidate]) {
        return isRight;
    }else{
        return isError;
    }
}
+ (RegexType)validateNumeric:(NSString *)str
{
    NSString *regex = @"^[0-9]*$";
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([test evaluateWithObject:str]) {
        return isRight;
    }else{
        return isError;
    }
}

+(RegexType)isValidateUserNameDefault:(NSString *)userName withMsg:(NSString *)msg
{
    if (userName == nil || [userName isEqualToString:@""]) {
        return isNill;
    }
    //    NSString *regex = @"^[a-z,A-Z,@,-,0-9]{5,16}$";
    //0827
    NSString *regex = @"^[a-z,A-Z][a-z,A-Z,0-9,_]{7,13}$"; // change tianzhu0719
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([test evaluateWithObject:userName]) {
        return isRight;
    }else{
        return isError;
    }
}

+(RegexType)isValidatePsw:(NSString *)psw withMsg:(NSString *)msg{
    if (psw == nil || [psw isEqualToString:@""]) {
        return isNill;
    }
    NSString *regex = @"^[a-z,A-Z,0-9][a-z,A-Z,0-9,_]{1,13}$";//change tianzhu0719
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([test evaluateWithObject:psw]) {
        return isRight;
    }else{
        
        return isError;
    }
    
}
+(RegexType)isValidateBlank:(NSString*)blank{
    if (blank == nil || [blank isEqualToString:@""]) {
        return isNill;
    }
    NSString *regex = @"\\s";//change tianzhu0719
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([test evaluateWithObject:blank]) {
        return isRight;
    }else{
        
        return isError;
    }
}

//+ (NSString*)convertRegexWithText:(NSString*)text {
//    
//    NSString *reg = @"\\[[^\\]]+<\\d+>\\]";
//    NSArray *matches    = [text componentsMatchedByRegex:reg];
//    if (matches.count > 0) {
//        
//        for (NSString   *subStr in matches) {
//            NSString    *pushId = [subStr stringByMatching:@"\\<\\d+>"];
//            text  = [text stringByReplacingOccurrencesOfString:pushId withString:@""];
//        }
//    }
//    
//    return text;
//}

@end
