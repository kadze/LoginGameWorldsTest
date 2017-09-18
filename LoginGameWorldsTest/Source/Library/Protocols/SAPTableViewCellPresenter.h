//
//  SAPTableViewCellPresenter.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/18/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol SAPTableViewCellPresenter <NSObject>
@property (nonatomic, strong) id model;
@property (nonatomic, weak) UITableViewCell *cell;

- (void)configureCell;

@end
