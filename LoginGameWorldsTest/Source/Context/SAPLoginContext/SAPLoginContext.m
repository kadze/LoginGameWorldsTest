//
//  SAPLoginContext.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

@import UIKit.UIDevice;

#import "SAPLoginContext.h"
#import "SAPGameWorld.h"

static NSString * const kSAPLoginKey = @"login";
static NSString * const kSAPPasswordKey = @"password";
static NSString * const kSAPDeviceTypeKey = @"deviceType";
static NSString * const kSAPDeviceIdKey = @"deviceId";
static NSString * const kSAPAvailableWorldsKey = @"allAvailableWorlds";

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
    NSPropertyListFormat format;
    NSError *error;
    NSDictionary *plist = [NSPropertyListSerialization propertyListWithData:data options:0 format:&format error:&error];
    
    NSString *errorString = plist[@"error"];
    if (errorString) {
        [self.delegate loginFailedWithMessage:errorString];
        
        return;
    }
    
    NSArray *worldsInfo = plist[kSAPAvailableWorldsKey];
    NSMutableArray *worlds = [NSMutableArray new];
    for (NSDictionary *worldInfo in worldsInfo) {
        NSError *error1 = nil;
        SAPGameWorld *gameWorld = [[SAPGameWorld alloc] initWithDictionary:worldInfo error:&error1];
        if (error) {
            NSLog(@"Could not load wold info %@", worldInfo);
        }
        
        if (gameWorld) {
            [worlds addObject:gameWorld];
        }
    }
    
    [self.delegate loginSuccessfulWithWorlds:worlds];
}

- (void)handleConnectionError:(NSError *)error {
    [self.delegate loginFailedWithError:error];
}

@end
