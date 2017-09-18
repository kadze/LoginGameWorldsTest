//
//  SAPGameWorldCellPesenter.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/18/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPGameWorldCellPesenter.h"

#import "SAPGameWorld.h"

@implementation SAPGameWorldCellPesenter

#pragma mark -
#pragma mark Class Methods

+ (instancetype)presenterWithCell:(SAPGameWorldTableViewCell *)cell model:(SAPGameWorld *)model {
    return [[self alloc] initWithCell:cell model:model];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithCell:(SAPGameWorldTableViewCell *)cell model:(SAPGameWorld *)model {
    self = [super init];
    self.cell = cell;
    self.model = model;
    
    return self;
}

#pragma mark -
#pragma mark SAPTableViewCellPresenter

- (void)configureCell {
    SAPGameWorldTableViewCell *cell = self.cell;
    SAPGameWorld *world = self.model;
    cell.nameLabel.text = world.name;
    
    NSString *countryCode = world.country;
    NSString *countryName = [[NSLocale systemLocale] displayNameForKey:NSLocaleCountryCode value:countryCode];
    cell.countryLabel.text = countryName;
}

@end
