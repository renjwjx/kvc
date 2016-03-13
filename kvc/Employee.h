//
//  Employee.h
//  kvc
//
//  Created by renjinwei on 16/3/13.
//  Copyright © 2016年 renjinwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Employee : NSObject {
    NSNumber *salary;
}

@property (retain) NSNumber *salary;

+ (id)employeeWithSalary:(int)s;

@end
