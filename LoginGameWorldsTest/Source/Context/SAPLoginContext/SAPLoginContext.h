//
//  SAPLoginContext.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SAPDataTaskContext.h"

@protocol SAPLoginContextDelegate <NSObject>

- (void)loginSuccessfulWithWorlds:(NSArray *)worlds;
- (void)loginFailedWithError:(NSError *)error;
- (void)loginFailedWithMessage:(NSString *)message;

@end

@interface SAPLoginContext : SAPDataTaskContext
+ (instancetype)contextWithLogin:(NSString *)login password:(NSString *)password delegate:(id<SAPLoginContextDelegate>)delegate;

@end
