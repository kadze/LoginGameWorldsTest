//
//  SAPGameWorldsControllerDataSource.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/18/17.
//  Copyright © 2017 SAP. All rights reserved.
//

@import UIKit;

@class SAPGameWorld;

@interface SAPGameWorldsControllerDataSource : NSObject <UITableViewDataSource>
@property (nonatomic, strong) NSArray<SAPGameWorld *> *worlds;
@property (nonatomic, weak) UITableView *tableView;

+ (instancetype)dataSourceWithWorlds:(NSArray<SAPGameWorld *> *)worlds tableView:(UITableView *)tableView;

@end
