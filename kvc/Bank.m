//
//  Bank.m
//  kvc
//
//  Created by renjinwei on 16/3/13.
//  Copyright © 2016年 renjinwei. All rights reserved.
//

#import "Bank.h"

@implementation Bank



-(void)setName:(NSString *)name
{
    [self willChangeValueForKey:@"banlance"];
    [self willChangeValueForKey:@"name"];
    _name = [@"new " stringByAppendingString:name];
    [self didChangeValueForKey:@"name"];
    [self didChangeValueForKey:@"banlance"];
}

+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key
{
    if ([key isEqualToString:@"name"]) {
        return NO;
    }
    return YES;

}


@end
