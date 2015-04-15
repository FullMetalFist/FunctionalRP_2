//
//  RootSampleViewController.m
//  ReactiveCocoa
//
//  Created by Michael Vilabrera on 4/13/15.
//  Copyright (c) 2015 Giving Tree. All rights reserved.
//

#import "RootSampleViewController.h"

#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RootSampleViewController ()

@property (nonatomic) UITextField *textField;

@end

@implementation RootSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTextField];
    
    [self.textField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"New Value: %@", x);
    } error:^(NSError *error) {
        NSLog(@"Error: %@", error);
    } completed:^{
        NSLog(@"Completed");
    }];
}

- (void) createTextField
{
    CGRect textFieldFrame = CGRectMake(10, 10, 200, 50);
    self.textField = [[UITextField alloc] initWithFrame:textFieldFrame];
    self.textField.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.textField];
}

@end
