//
//  ViewController.m
//  kvc
//
//  Created by renjinwei on 16/3/13.
//  Copyright © 2016年 renjinwei. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Department.h"

@interface ViewController ()
@property (strong, nonatomic)Person* perA;
@property (strong, nonatomic)Department* depA;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _perA = [[Person alloc] init];

    _perA.salary = [NSNumber numberWithInt:200];
    _perA.stringProperty = @"nameLi";
    _depA = [[Department alloc] initWithEmployees:[NSArray arrayWithObject:[Employee employeeWithSalary:100]]];
    [_depA addObserver:self forKeyPath:@"employees.@count" options:NSKeyValueObservingOptionNew context:NULL];

}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"viewController keyPath: %@, object: %@, change: %@, context: %@", keyPath, object, change, context);
}

- (IBAction)btnPressed:(id)sender
{

//  [_depA addEmployeeObject:[Employee employeeWithSalary:110]];
    //kvo second method
    [_depA insertObject:[Employee employeeWithSalary:1] inEmployeesAtIndex:0];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
