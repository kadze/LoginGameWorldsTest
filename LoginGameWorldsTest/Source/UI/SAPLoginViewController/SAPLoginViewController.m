//
//  SAPLoginViewController.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPLoginViewController.h"

@interface SAPLoginViewController () <UITextFieldDelegate>

@end

@implementation SAPLoginViewController

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.emailTextField) {
        [self.passwordTextField becomeFirstResponder];
    } else if (textField == self.passwordTextField) {
        [self login];
    }
    
    return YES;
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (void)login {
    NSLog(@"login");
}

@end
