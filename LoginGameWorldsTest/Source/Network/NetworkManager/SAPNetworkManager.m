//
//  SAPNetworkManager.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

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

@end
