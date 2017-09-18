//
//  SAPGameWorldsControllerDataSource.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/18/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPGameWorldsControllerDataSource.h"

@implementation SAPGameWorldsControllerDataSource

#pragma mark -
#pragma mark Class Methods

+ (instancetype)dataSourceWithWorlds:(NSArray<SAPGameWorld *> *)worlds tableView:(UITableView *)tableView {
    return [[self alloc] initWithWorlds:worlds tableView:tableView];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithWorlds:(NSArray<SAPGameWorld *> *)worlds tableView:(UITableView *)tableView {
    self = [super init];
    self.tableView = tableView;
    self.worlds = worlds;
    
    return self;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.worlds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [UITableViewCell new];
}

@end
