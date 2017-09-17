//
//  SAPDataTaskContext.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPDataTaskContext.h"

#import "SAPDispatch.h"

@interface SAPDataTaskContext ()
@property (nonatomic, strong) NSURLSessionDataTask *dataTask;

@end

@implementation SAPDataTaskContext

#pragma mark -
#pragma mark Accessors

- (void)setDataTask:(NSURLSessionDataTask *)dataTask {
    if (_dataTask) {
        [_dataTask cancel];
    }
    
    _dataTask = dataTask;
}

#pragma mark -
#pragma mark SAPContext

- (void)execute {
    NSMutableURLRequest *request = [self request];
    [request setValue:@"text/xml" forHTTPHeaderField:@"Content-Type"];
    NSData *body = [self requestDictionaryData];
    [request setHTTPBody:body];
//    showNetworkActivityIndicatorIOS()
    self.dataTask = [[self urlSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error)
    {
        if (error) {
            [self handleConnectionError:error];
        }
        
        SAPDispatchAsyncOnMainQueue(^{
//            self.hideNetworkActividyIndicatorIOS()
            if (data) {
                [self handleResponseData:data];
            }
        });
    }];
    
    if (self.dataTask) {
        [self.dataTask resume];
    } else {
//        hideNetworkActividyIndicatorIOS()
    }
}

#pragma mark -
#pragma mark Public

- (void)cancel {
    [self.dataTask cancel];
}

- (void)handleResponseData:(NSData *)data {
    
}

#pragma mark -
#pragma mark Private

- (NSData *)requestDictionaryData {
    return [NSKeyedArchiver archivedDataWithRootObject:[self requestDictionary]];
}

@end
