//
//  SAPGameWorld.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/17/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "SAPWorldStatus.h"

@interface SAPGameWorld : JSONModel
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *mapURL;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *language;
@property (nonatomic, copy) NSString *worldID;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, strong) SAPWorldStatus *worldStatus;

@end
