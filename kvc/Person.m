//
//  Person.m
//  kvc
//
//  Created by renjinwei on 16/3/13.
//  Copyright © 2016年 renjinwei. All rights reserved.
//

#import "Person.h"
#import "Bank.h"

@interface Person()

@property (strong, readwrite)Bank* bankBanlance;
@end

@implementation Person

- (id) init
{
    self = [super init];
    if (self) {
        _bankBanlance = [[Bank alloc] init];
        _bankBanlance.banlance = 100;
//        [_bankBanlance addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:NULL];
//        [_bankBanlance addObserver:self forKeyPath:@"banlance" options:NSKeyValueObservingOptionNew| NSKeyValueObservingOptionOld context:NULL];
        return self;
    }
    return nil;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"keyPath: %@, object: %@, change: %@, context: %@", keyPath, object, change, context);
}


//- (NSString*)stringProperty
//{
////    return @"not change";
//    return self.stringProperty;
//}

- (void)setStringProperty:(NSString *)stringProperty
{
    _stringProperty = @"init value";
}


- (void)dealloc
{
//    [_bankBanlance removeObserver:self forKeyPath:@"banlance"];
}

- (NSString*)fullName
{
    return [NSString stringWithFormat:@"%@ %@", _firstName, _lastName];
}


+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    
    if ([key isEqualToString:@"fullName"]) {
        NSArray *affectingKeys = @[@"lastName", @"firstName"];
        keyPaths = [keyPaths setByAddingObjectsFromArray:affectingKeys];
    }
    return keyPaths;
}

+ (NSSet *)keyPathsForValuesAffectingFullName
{
    return [NSSet setWithObjects:@"firstName", @"lastName", nil];
}


- (void)setSalary:(NSNumber *)salary
{
    _salary = salary;
}



@end
