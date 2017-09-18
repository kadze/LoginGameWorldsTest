//
//  SAPGameWorldTableViewCell.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/18/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPGameWorldTableViewCell.h"

@implementation SAPGameWorldTableViewCell

#pragma mark -
#pragma mark Accessors

- (void)setPresenter:(id<SAPTableViewCellPresenter>)presenter {
    [presenter configureCell];
}

@end
