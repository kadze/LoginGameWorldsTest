//
//  SAPGameWorldTableViewCell.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/18/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAPTableViewCellPresenter.h"

@interface SAPGameWorldTableViewCell : UITableViewCell
@property (nonatomic, strong) IBOutlet UIImageView  *image;
@property (nonatomic, strong) IBOutlet UILabel      *nameLabel;
@property (nonatomic, strong) IBOutlet UILabel      *countryLabel;

@property (nonatomic, strong) id<SAPTableViewCellPresenter> presenter;

@end
