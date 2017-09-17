//
//  SAPLoginViewController.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPLoginViewController.h"

#import "SAPLoginContext.h"

@interface SAPLoginViewController () <UITextFieldDelegate, SAPLoginContextDelegate>
@property (nonatomic, strong) SAPLoginContext *loginContext;

@end

@implementation SAPLoginViewController

#pragma mark -
#pragma mark Accessors

- (void)setLoginContext:(SAPLoginContext *)loginContext {
    if (_loginContext) {
        [_loginContext cancel];
    }
    
    _loginContext = loginContext;
    [loginContext execute];
}

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
#pragma mark SAPLoginContextDelegate

- (void)loginSuccessfulWithWorlds:(NSArray *)worlds {
    NSLog(@"%@", worlds);
}

- (void)loginFailedWithError:(NSError *)error {
    
}

#pragma mark -
#pragma mark Actions 

- (IBAction)onLoginButton:(UIButton *)sender {
    [self login];
}

#pragma mark -
#pragma mark Private

- (void)login {
    self.loginContext = [SAPLoginContext contextWithEmail:self.emailTextField.text
                                                 password:self.passwordTextField.text
                                                 delegate:self];
}


@end
