//
//  ViewController.m
//  DropDownMenuForNavControllerTitle
//
//  Created by weiming wu on 3/9/16.
//  Copyright © 2016 weiming wu. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *items = @[@"1",@"2",@"3"];
    WWMDropDownMenu *menu = [[WWMDropDownMenu alloc]
                             init:CGRectMake(0.0, 0.0, 300, 44)
                             title:@"Example"
                             items:items
                             containerView:self.view
                             selectedIndex:0];
    self.navigationItem.titleView = menu;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
