//
//  SAPGameWorldsViewController.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/18/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPGameWorldsViewController.h"

#import "SAPGameWorldsControllerDataSource.h"

@interface SAPGameWorldsViewController ()
@property (nonatomic, weak) IBOutlet UITableView                *tableView;
@property (nonatomic, strong) SAPGameWorldsControllerDataSource *dataSoruce;

@end

@implementation SAPGameWorldsViewController

#pragma mark -
#pragma mark Accessors

- (void)setWorlds:(NSArray<SAPGameWorld *> *)worlds {
    _worlds = worlds;
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    SAPGameWorldsControllerDataSource *dataSource = [SAPGameWorldsControllerDataSource dataSourceWithWorlds:self.worlds
                                                                                                  tableView:self.tableView];
    
    self.dataSoruce = dataSource;
    self.tableView.dataSource = dataSource;
    [self.tableView reloadData];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Logout" style:UIBarButtonItemStylePlain target:self action:@selector(onLogoutButton:)];
}

#pragma mark -
#pragma mark Actions

- (void)onLogoutButton:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark Private


@end
