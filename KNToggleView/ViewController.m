//
//  ViewController.m
//  KNToggleView
//
//  Created by vbn on 16/12/1.
//  Copyright © 2016年 vbn. All rights reserved.
//

#import "ViewController.h"
#import "KNToggleView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:[[KNToggleView alloc] initWithFrame:CGRectMake(100, 200, 70, 25)]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
