//
//  SAPNetworkManager.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

@import UIKit.UIApplication;

#import "SAPNetworkManager.h"

static NSString * const kSAPBackgroundSessionID = @"LoginGameWorlds.SAP";

@interface SAPNetworkManager ()
//lazy properties
@property (nonatomic, strong) NSURLSession *defaultSession;
@property (nonatomic, strong) NSURLSession *ephemeralSession;
@property (nonatomic, strong) NSURLSession *backgroundSession;

@end

@implementation SAPNetworkManager

#pragma mark -
#pragma mark Class Methods

+ (instancetype)sharedInstance {
    static id _sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    
    return _sharedInstance;
}

+ (NSURLSessionConfiguration *)defaultConfiguration {
    return NSURLSessionConfiguration.defaultSessionConfiguration;
}

#pragma mark -
#pragma mark Public

- (NSURLSession *)defaultSession {
    if (!_defaultSession) {
        _defaultSession = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.defaultSessionConfiguration];
    }
    
    return _defaultSession;
}

- (NSURLSession *)ephemeralSession {
    if (!_ephemeralSession) {
        _ephemeralSession = [NSURLSession sessionWithConfiguration:NSURLSessionConfiguration.ephemeralSessionConfiguration];
    }
    
    return _ephemeralSession;
}

- (NSURLSession *)backgroundSession {
    if (!_backgroundSession) {
        _backgroundSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:kSAPBackgroundSessionID]];
    }
    
    return _backgroundSession;
}

- (void)setNetworkActivityIndicatorVisible:(BOOL)visible {
    static NSInteger NumberOfCallsToSetVisible = 0;
    if (visible) {
        NumberOfCallsToSetVisible++;
    } else {
        NumberOfCallsToSetVisible--;
    }
    
    // The assertion helps to find programmer errors in activity indicator management.
    // Since a negative NumberOfCallsToSetVisible is not a fatal error,
    // it should probably be removed from production code.
    NSAssert(NumberOfCallsToSetVisible >= 0, @"Network Activity Indicator was asked to hide more often than shown");
    
    // Display the indicator as long as our static counter is > 0.
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:(NumberOfCallsToSetVisible > 0)];
}

@end
