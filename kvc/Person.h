//
//  Person.h
//  kvc
//
//  Created by renjinwei on 16/3/13.
//  Copyright © 2016年 renjinwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bank.h"

@interface Person : NSObject
@property (strong, nonatomic) NSString *stringProperty;
@property (assign, nonatomic) NSNumber *salary;
@property Person *linkedInstance;
@property (strong, readonly)Bank* bankBanlance;
@property (strong, nonatomic)NSString* fullName;
@property (strong, nonatomic)NSString* firstName;
@property (strong, nonatomic)NSString* lastName;

@end





