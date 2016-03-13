#import "Department.h"
#import "Employee.h"

@implementation Department

@synthesize employees;

- (id)initWithEmployees:(NSArray *)theEmployees {
    if (self = [super init]) {
        employees = [NSMutableArray arrayWithArray:theEmployees];
//        [self addObserver:self forKeyPath:@"employees.@count" options:(NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew) context:nil];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    NSLog(@"%@", [change objectForKey:NSKeyValueChangeKindKey]);
    NSLog(@"%@", [change objectForKey:NSKeyValueChangeIndexesKey]);
    NSLog(@"%@ chagned from %@ to %@", keyPath, [change objectForKey:NSKeyValueChangeOldKey], [change objectForKey:NSKeyValueChangeNewKey]);
    
    [self setTotalSalary:[[self valueForKeyPath:@"employees.@sum.salary"] intValue]];
}

- (id)valueForUndefinedKey:(NSString *)theKey {
    return @"Unknown";
}

- (void)setTotalSalary:(int)theTotalSalary {
    if (theTotalSalary != totalSalary) {
        //[self willChangeValueForKey:@"totalSalary"];
        totalSalary = theTotalSalary;
        //[self didChangeValueForKey:@"totalSalary"];
    }
}
//return the proxy nsarray
- (NSMutableArray *)employeesArray {
    return [self mutableArrayValueForKey:NSStringFromSelector(@selector(employees))];
}

- (void)addEmployeeObject:(Employee *)object
{
    [[self employeesArray] addObject:object];
}
// for kvo nsarray
- (void)insertObject:(Employee *)object inEmployeesAtIndex:(NSUInteger)index
{
    [self.employees insertObject:object atIndex:index];
}
//for kvo nsarray
- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index
{
    [self.employees removeObjectAtIndex:index];
}

- (int)totalSalary {
    return totalSalary;
}

- (void)dealloc {
    [self removeObserver:self forKeyPath:@"employees.@count"];
}
@end