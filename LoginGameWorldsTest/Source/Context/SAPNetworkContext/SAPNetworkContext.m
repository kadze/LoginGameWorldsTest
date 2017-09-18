//
//  SAPNetworkContext.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPNetworkContext.h"

#import "SAPNetworkManager.h"

static NSTimeInterval const kSAPRequestTimeout = 120;

@implementation SAPNetworkContext

#pragma mark -
#pragma mark Accessors

#pragma mark -
#pragma mark SAPContext

- (void)execute {
    
}

#pragma mark -
#pragma mark Public

- (void)cancel {
    
}

- (NSString *)urlStringForRequest {
    return @"";
}

- (NSURL *)url {
    return [NSURL URLWithString:[self urlStringForRequest]];
}

- (NSDictionary *)requestDictionary {
    return @{@"":@""};
}

- (SAPHTTPMethod)httpMethod {
    return kSAPHttpMethodPost;
}

- (NSURLSession *)urlSession {
    return [[SAPNetworkManager sharedInstance] ephemeralSession];
}

- (NSMutableURLRequest *)request {
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[self url]];
    request.timeoutInterval = [self requestTimeout];
    request.HTTPMethod = [self httpMethodDescription:[self httpMethod]];
    
    return request;
}

- (NSTimeInterval)requestTimeout {
    return kSAPRequestTimeout;
}

- (void)handleConnectionError:(NSError *)error {
    NSLog(@"%@", error.localizedDescription);
}

#pragma mark -
#pragma mark Private

- (NSString *)httpMethodDescription:(SAPHTTPMethod)httpMethod {
    switch (httpMethod) {
        case kSAPHttpMethodGet:
            return @"GET";
        case kSAPHttpMethodPost:
            return @"POST";
        case kSAPHttpMethodDelete:
            return @"DELETE";
    }
}

@end
