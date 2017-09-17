//
//  SAPNetworkContext.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SAPContext.h"

typedef enum : NSUInteger {
    kSAPHttpMethodGet,
    kSAPHttpMethodPost,
    kSAPHttpMethodDelete
} SAPHTTPMethod;

@interface SAPNetworkContext : NSObject <SAPContext>

- (void)cancel;

- (NSString *)urlStringForRequest; //empty string by default
- (NSURL *)url;
- (SAPHTTPMethod)httpMethod;
- (NSURLSession *)urlSession;
- (NSURLRequest *)request;
- (NSTimeInterval)requestTimeout;

@end
