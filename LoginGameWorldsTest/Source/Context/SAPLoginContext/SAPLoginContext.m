//
//  SAPLoginContext.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

@import UIKit.UIDevice;

#import "SAPLoginContext.h"

static NSString * const kSAPLoginKey = @"login";
static NSString * const kSAPPasswordKey = @"password";
static NSString * const kSAPDeviceTypeKey = @"deviceType";
static NSString * const kSAPDeviceIdKey = @"deviceId";


@interface SAPLoginContext()
@property (nonatomic, copy) NSString *login;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, weak) id<SAPLoginContextDelegate> delegate;

@end

@implementation SAPLoginContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithLogin:(NSString *)login password:(NSString *)password delegate:(id<SAPLoginContextDelegate>)delegate {
    return [[self alloc] initWithLogin:login password:password delegate:delegate];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithLogin:(NSString *)login password:(NSString *)password delegate:(id<SAPLoginContextDelegate>)delegate {
    self = [super init];
    self.login = login;
    self.password = password;
    self.delegate = delegate;
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSString *)urlStringForRequest {
    return @"https://backend1.lordsandknights.com/XYRALITY/WebObjects/BKLoginServer.woa/wa/worlds";
}

- (NSDictionary *)requestDictionary {
    if (!self.login || !self.password) {
        return @{@"":@""};
    }
    
    UIDevice *device = UIDevice.currentDevice;
    NSString *deviceType = [NSString stringWithFormat:@"%@ - %@ %@", device.model, device.systemName, device.systemVersion];
    
    return @{kSAPLoginKey : self.login,
             kSAPPasswordKey : self.password,
             kSAPDeviceIdKey : NSUUID.UUID.UUIDString,
             kSAPDeviceTypeKey : deviceType};
}

- (void)handleResponseData:(NSData *)data {
    NSLog(@"%@", [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding]);
}

- (void)handleConnectionError:(NSError *)error {
    [self.delegate loginFailedWithError:error];
}

@end
