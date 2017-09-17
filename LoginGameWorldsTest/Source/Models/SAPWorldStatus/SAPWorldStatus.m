//
//  SAPWorldStatus.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPWorldStatus.h"

@implementation SAPWorldStatus

+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"statusID": @"id",
                                                                  @"statusDescription" : @"description"}];
}

@end
