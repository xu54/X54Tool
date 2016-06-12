//
//  X54Tool.m
//  Face54
//
//  Created by xu54 on 16/6/11.
//  Copyright © 2016年 xu54. All rights reserved.
//

#import "X54Tool.h"
#import <objc/runtime.h>
@implementation X54Tool
+(NSDictionary *)runTimeDictionaryWith:(id)obj
{
    NSMutableDictionary *dictionaryFormat = [NSMutableDictionary dictionary];
    Class cls = [obj class];
    
    unsigned int ivarsCnt = 0;
    Ivar *ivars = class_copyIvarList(cls, &ivarsCnt);
    
    for (const Ivar *p = ivars; p < ivars + ivarsCnt; ++p)
    {
        Ivar const ivar = *p;
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        id value = [obj valueForKey:key];
        const char *type = ivar_getTypeEncoding(ivar);
        if (value)
        {
            [dictionaryFormat setObject:value forKey:key];
        }
    }
    return dictionaryFormat;
}

@end
