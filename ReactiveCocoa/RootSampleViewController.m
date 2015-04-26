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
    
    // shorter, suggested version
    [self.textField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"New Value: %@", x);
    }];
}

- (void) createTextField
{
    // redefined 20,200,200,20 container
    CGRect textFieldFrame = CGRectMake(20, 200, 200, 20);
    self.textField = [[UITextField alloc] initWithFrame:textFieldFrame];
    self.textField.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.textField];
}

@end
