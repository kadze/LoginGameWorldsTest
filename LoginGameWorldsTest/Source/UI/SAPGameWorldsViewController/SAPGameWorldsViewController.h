//
//  SAPGameWorldsViewController.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/18/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SAPGameWorld;

@interface SAPGameWorldsViewController : UIViewController
@property (nonatomic, strong) NSArray<SAPGameWorld *> *worlds;

@end
