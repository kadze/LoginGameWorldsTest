//
//  SAPLoginViewController.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPLoginViewController.h"

#import "SAPLoginContext.h"
#import "SAPGameWorld.h"
#import "SAPLoginView.h"
#import "SAPGameWorldsViewController.h"

#import "UIAlertController+SAPExtensions.h"

#import "SAPViewControllerMacro.h"

static NSString * const kSAPLoginFailedTitle = @"Login failed";

@interface SAPLoginViewController () <UITextFieldDelegate, SAPLoginContextDelegate>
@property (nonatomic, strong) SAPLoginContext *loginContext;

@end

SAPViewControllerBaseViewProperty(SAPLoginViewController, SAPLoginView, mainView)

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
    SAPGameWorldsViewController *gameWorldsController = [SAPGameWorldsViewController new];
    gameWorldsController.worlds = worlds;
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:gameWorldsController];
    [self presentViewController:navController animated:YES completion:nil];
    
    [self.mainView setLoadingViewVisible:NO animated:NO completion:nil];
}

- (void)loginFailedWithError:(NSError *)error {
    [self loginFailedWithMessage:error.localizedDescription];
}

- (void)loginFailedWithMessage:(NSString *)message {
    [self.mainView setLoadingViewVisible:NO animated:YES completion:^{
        [UIAlertController presentAlertControllerWithTitle:kSAPLoginFailedTitle message:message];
    }];
}

#pragma mark -
#pragma mark Actions 

- (IBAction)onLoginButton:(UIButton *)sender {
    [self login];
}

- (IBAction)onFillTestCredentialsButton:(UIButton *)sender {
    self.emailTextField.text = @"ios.test@xyrality.com";
    self.passwordTextField.text = @"password";
}

#pragma mark -
#pragma mark Private

- (void)login {
    [self.passwordTextField resignFirstResponder];
    [self.mainView setLoadingViewVisible:YES animated:YES completion:nil];
    self.loginContext = [SAPLoginContext contextWithLogin:self.emailTextField.text
                                                 password:self.passwordTextField.text
                                                 delegate:self];
}

@end
