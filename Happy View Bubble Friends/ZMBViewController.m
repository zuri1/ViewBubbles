//
//  ZMBViewController.m
//  Happy View Bubble Friends
//
//  Created by Zuri Biringer on 11/1/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "ZMBViewController.h"
#import "UIView+Rounded.h"

@interface ZMBViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation ZMBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    UIView *bubbleView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    bubbleView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:bubbleView];
    bubbleView.layer.cornerRadius = 30.f;
    bubbleView.clipsToBounds = YES;
    
    UIView *bubbleView2 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
    bubbleView2.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:bubbleView2];
    bubbleView2.layer.cornerRadius = 30.f;
    bubbleView2.clipsToBounds = YES;
    
    UIView *bubbleView3 = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 60, 60)];
    bubbleView3.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:bubbleView3];
    bubbleView3.layer.cornerRadius = 30.f;
    bubbleView3.clipsToBounds = YES;
    
    UIView *bubbleView4 = [[UIView alloc] initWithFrame:CGRectMake(30, 200, 60, 60)];
    bubbleView4.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:bubbleView4];
    bubbleView4.layer.cornerRadius = 30.f;
    bubbleView4.clipsToBounds = YES;
    
    UIView *bubbleView5 = [[UIView alloc] initWithFrame:CGRectMake(180, 300, 60, 60)];
    bubbleView5.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:bubbleView5];
    bubbleView5.layer.cornerRadius = 30.f;
    bubbleView5.clipsToBounds = YES;
    
    _bubbleViews = [NSArray arrayWithObjects: bubbleView, bubbleView2, bubbleView3, bubbleView4, bubbleView5, nil];
    
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    UIGravityBehavior *gravityBehavior = [[UIGravityBehavior alloc] initWithItems:self.bubbleViews];
    
    [_animator addBehavior: gravityBehavior];
    
    UICollisionBehavior *collisionBehavior = [[UICollisionBehavior alloc] initWithItems: self.bubbleViews];
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior: collisionBehavior];
    
    for (UIView *bubbleView in _bubbleViews)
    {
        for (int i = 0; i < 5; i++)
        {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * 9 + 8, 30, 4, 4)];
            view.backgroundColor = [UIColor redColor];
            [bubbleView addSubview:view];
            view.layer.cornerRadius = 2.f;
            view.clipsToBounds = YES;
            //[gravityBehavior addItem:view];
            //[collisionBehavior addItem:view];
        }
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end