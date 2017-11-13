//
//  UIFont+mcFonts.m
//  haochang
//
//  Created by lc on 7/16/14.
//  Copyright (c) 2014 Administrator. All rights reserved.
//

#import "UIFont+mcFonts.h"

@implementation UIFont (mcFonts)

+(UIFont *)mcFontBig {
    return [UIFont systemFontOfSize:18.f];
}

+(UIFont *)mcFontNomarl {
    return [UIFont systemFontOfSize:15.f];
}

+(UIFont *)mcFontSmall {
    return [UIFont systemFontOfSize:13.f];
}

+(UIFont *)mcFontSuperSmall {
    return [UIFont systemFontOfSize:11.f];
}

+(UIFont *)mcFontBoldBig {
    return [UIFont boldSystemFontOfSize:18.f];
}

+(UIFont *)mcFontBoldNomarl {
    return [UIFont boldSystemFontOfSize:15.f];
}

+(UIFont *)mcFontBoldSmall {
    return [UIFont boldSystemFontOfSize:13.f];
}

+(UIFont *)mcFontBoldSuperSmall {
    return [UIFont boldSystemFontOfSize:11.f];
}
@end
