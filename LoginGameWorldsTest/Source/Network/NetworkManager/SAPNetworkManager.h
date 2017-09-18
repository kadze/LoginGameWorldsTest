//
//  SAPNetworkManager.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SAPNetworkManager : NSObject

+ (instancetype)sharedInstance;

- (NSURLSession *)defaultSession;
- (NSURLSession *)ephemeralSession;
- (NSURLSession *)backgroundSession;

- (void)setNetworkActivityIndicatorVisible:(BOOL)visible;

@end
