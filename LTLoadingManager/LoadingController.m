//
//  LoadingController.m
//  LTLoadingManager
//
//  Created by Luther on 2019/4/22.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "LoadingController.h"
#import "LTLoadingManager.h"

@interface LoadingController ()

@end

@implementation LoadingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [LTLoadingManager showLoadingHudWithInView:self.view isShowMaskView:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [LTLoadingManager hidenHudFromView:self.view];
    });
}

@end
