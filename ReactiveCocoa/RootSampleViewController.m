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
@property (nonatomic) UIButton *button;

@end

@implementation RootSampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTextField];
    [self createButton];
    
//    // shorter, suggested version
//    [self.textField.rac_textSignal subscribeNext:^(id x) {
//        NSLog(@"New Value: %@", x);
//    }];
    RACSignal *validEmailSignal = [self.textField.rac_textSignal map:^id(NSString *value) {
        return @([value rangeOfString:@"@"].location != NSNotFound);
    }];
    RAC(self.button, enabled) = validEmailSignal;
    RAC(self.textField, textColor) = [validEmailSignal map:^id(id value) {
        if ([value boolValue]) {
            return [UIColor greenColor];
        }
        else {
            return [UIColor redColor];
        }
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

- (void) createButton
{
    // button configuration
    CGRect buttonFrame = CGRectMake(110.0f,
                                    240.0f,
                                    100.0f,
                                    44.0f);
    self.button = [[UIButton alloc] initWithFrame:buttonFrame];
    [self.button setTitle:@"Okay" forState:UIControlStateNormal];
    [self.button setTitle:@"OKAY" forState:UIControlStateHighlighted];
    self.button.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:self.button];
}

@end
