//
//  SAPLoginView.m
//  LoginGameWorldsTest
//
//  Created by ASH on 9/18/17.
//  Copyright © 2017 SAP. All rights reserved.
//

#import "SAPLoginView.h"

#import "SAPLoadingView.h"
#import "SAPActivityIndicator.h"

@interface SAPLoginView ()
@property (nonatomic, strong) UIView<SAPLoadingView> *loadingView;

@end

@implementation SAPLoginView

#pragma mark -
#pragma mark SAPViewWithLoadingView

- (void)setLoadingViewVisible:(BOOL)visible
                     animated:(BOOL)animated
                   completion:(void(^)(void))completion
{
    BOOL previousVisible = self.loadingView.visible;
    if (previousVisible != visible) {
        if (visible && !self.loadingView) {
            self.loadingView = [self createLoadingView];
        }
        
        [self bringSubviewToFront:self.loadingView];
        [self.loadingView setVisible:visible animated:animated completion:completion];
    }
}

#pragma mark -
#pragma mark Private

- (UIView<SAPLoadingView> *)createLoadingView {
    return [SAPActivityIndicator indicatorWithSuperview:self];
}

@end
