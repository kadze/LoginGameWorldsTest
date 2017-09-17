//
//  SAPLoginContext.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPLoginContext.h"

@interface SAPLoginContext()
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, weak) id<SAPLoginContextDelegate> delegate;

@end

@implementation SAPLoginContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithEmail:(NSString *)email password:(NSString *)password delegate:(id<SAPLoginContextDelegate>)delegate {
    return [[self alloc] initWithEmail:email password:password delegate:delegate];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithEmail:(NSString *)email password:(NSString *)password delegate:(id<SAPLoginContextDelegate>)delegate {
    self = [super init];
    self.email = email;
    self.password = password;
    self.delegate = delegate;
    
    return self;
}

#pragma mark -
#pragma mark Public

- (NSString *)urlStringForRequest {
    return @"";
}

- (NSDictionary *)requestDictionary {
    return @{@"":@""};
}

- (void)handleResponseData:(NSData *)data {
    
}

- (void)handleConnectionError:(NSError *)error {
    [self.delegate loginFailedWithError:error];
}

@end
