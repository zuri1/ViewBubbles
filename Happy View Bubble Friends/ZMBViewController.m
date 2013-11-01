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
    
    for (int i=0; i<5; i++) {
    
        CGFloat superviewWidth = self.view.frame.size.width;
        CGFloat xPos = superviewWidth/5*i + 5;
        CGFloat yPos = 20;
        CGFloat width = superviewWidth/6;
        CGFloat height = superviewWidth/6;
        
        CGRect viewRect = CGRectMake(xPos, yPos, width, height);
        
        UIView *newView = [[UIView alloc]initWithFrame:viewRect];
        newView.backgroundColor = [UIColor blueColor];
        [self.view addSubview:newView];
        newView.layer.cornerRadius = width/2;
        newView.clipsToBounds = YES;
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end