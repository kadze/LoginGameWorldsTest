//
//  SAPWorldStatus.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "JSONModel.h"

@interface SAPWorldStatus : JSONModel
@property (nonatomic, copy) NSString *statusDescription;
@property (nonatomic, copy) NSString *statusID;

@end
