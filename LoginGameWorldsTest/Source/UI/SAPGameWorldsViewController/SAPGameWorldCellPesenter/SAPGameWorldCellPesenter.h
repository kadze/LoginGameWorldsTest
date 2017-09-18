//
//  SAPGameWorldCellPesenter.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/18/17.
//  Copyright © 2017 SAP. All rights reserved.
//

@import UIKit.UITableViewCell;
#import "SAPTableViewCellPresenter.h"
#import "SAPGameWorldTableViewCell.h"

@class SAPGameWorld;

@interface SAPGameWorldCellPesenter : NSObject <SAPTableViewCellPresenter>
@property (nonatomic, strong) SAPGameWorld *model;
@property (nonatomic, weak) SAPGameWorldTableViewCell *cell;

+ (instancetype)presenterWithCell:(SAPGameWorldTableViewCell *)cell model:(SAPGameWorld *)model;
- (void)configureCell;

@end
