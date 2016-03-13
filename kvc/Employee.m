//
//  Employee.m
//  kvc
//
//  Created by renjinwei on 16/3/13.
//  Copyright © 2016年 renjinwei. All rights reserved.
//

#import "Employee.h"

@implementation Employee
@synthesize salary;

+ (id)employeeWithSalary:(int)s {
    Employee *e = [[Employee alloc] init];
    e.salary = [NSNumber numberWithInt:s];
    return e;
}


@end
