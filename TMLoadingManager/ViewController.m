//
//  ViewController.m
//  TMLoadingManager
//
//  Created by Luther on 2019/4/17.
//  Copyright © 2019 mrstock. All rights reserved.
//

#import "ViewController.h"
#import "TMLoadingManager.h"
#import "LoadingController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    LoadingController *controller = [[LoadingController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
    
}


@end
