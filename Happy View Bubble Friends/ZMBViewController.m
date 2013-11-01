//
//  ZMBViewController.m
//  Happy View Bubble Friends
//
//  Created by Zuri Biringer on 11/1/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "ZMBViewController.h"

@interface ZMBViewController ()

@end

@implementation ZMBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *newView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 40, 40)];
    newView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:newView];
    newView.layer.cornerRadius = 20.f;
    newView.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end