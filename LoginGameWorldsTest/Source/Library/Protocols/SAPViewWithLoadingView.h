//
//  SAPViewWithLoadingView.h
//  LoginGameWorldsTest
//
//  Created by ASH on 9/18/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SAPViewWithLoadingView <NSObject>

- (void)setLoadingViewVisible:(BOOL)visible
                     animated:(BOOL)animated
                   completion:(void(^)(void))completion;

@end
