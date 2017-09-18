//
//  SAPDataTaskContext.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPNetworkContext.h"

@interface SAPDataTaskContext : SAPNetworkContext

- (void)cancel;
- (void)handleResponseData:(NSData *)data;

@end
