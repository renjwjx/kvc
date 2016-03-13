//
//  Department.h
//  kvc
//
//  Created by renjinwei on 16/3/13.
//  Copyright © 2016年 renjinwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"
@class Employee;
@interface Department : NSObject {
    NSMutableArray *employees;
    int totalSalary;
}

@property (retain) NSMutableArray *employees;

- (id)initWithEmployees:(NSArray *)theEmployees;
- (int)totalSalary;
- (void)setTotalSalary:(int)theTotalSalary;
- (void)addEmployeeObject:(Employee *)object;

- (void)insertObject:(Employee *)object inEmployeesAtIndex:(NSUInteger)index;

- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index;
@end
