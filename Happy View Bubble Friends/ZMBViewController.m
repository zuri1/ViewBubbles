//
//  ZMBViewController.m
//  Happy View Bubble Friends
//
//  Created by Zuri Biringer on 11/1/13.
//  Copyright (c) 2013 Zuri Biringer. All rights reserved.
//

#import "ZMBViewController.h"
#import "UIView+Rounded.h"

@interface ZMBViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIDynamicAnimator *animator;

@end

@implementation ZMBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _bubbleView = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 60, 60)];
    
    _bubbleView2 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 60, 60)];
    
    _bubbleView3 = [[UIView alloc] initWithFrame:CGRectMake(200, 200, 60, 60)];
    
    _bubbleView4 = [[UIView alloc] initWithFrame:CGRectMake(30, 200, 60, 60)];
    
    _bubbleView5 = [[UIView alloc] initWithFrame:CGRectMake(180, 300, 60, 60)];
    
    _bubbleViews = [NSArray arrayWithObjects:_bubbleView, _bubbleView2, _bubbleView3, _bubbleView4, _bubbleView5, nil];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear: animated];
    
    for (UIView *someBubbleView in _bubbleViews) {
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        
        someBubbleView.backgroundColor = [UIColor purpleColor];
        [self.view addSubview:someBubbleView];
        someBubbleView.layer.cornerRadius = 30.f;
        someBubbleView.clipsToBounds = YES;
        [someBubbleView addGestureRecognizer:tapGestureRecognizer];

    }
    
    
    //    [self.view addGestureRecognizer:tapGestureRecognizer];
    //    tapGestureRecognizer.delegate = self;
    
    

    
    for (UIView *bubbleView in _bubbleViews)
    {
        CABasicAnimation* boundsAnim = [CABasicAnimation animationWithKeyPath:@"bounds"];
        boundsAnim.fromValue = [NSValue valueWithCGRect:bubbleView.layer.bounds];
        boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(20, 20, 30, 30)];
        boundsAnim.duration = 4.0;
        [bubbleView.layer addAnimation:boundsAnim forKey:@"bounds"];
        
        // Change the actual data value in the layer to the final value.
        bubbleView.layer.bounds = CGRectMake(20, 20, 30, 30);
    }
    
    
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
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(i * 6 + 27, 34, 3, 3)];
            view.backgroundColor = [UIColor redColor];
            [bubbleView addSubview:view];
            view.layer.cornerRadius = 1.5f;
            view.clipsToBounds = YES;
            //[gravityBehavior addItem:view];
            //[collisionBehavior addItem:view];
        }
    }
}


//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    NSSet *allTouches = [event touchesForView:_stubbleView];
//    for (UITouch *touch in allTouches)
//    {
//        CGPoint location = [touch locationInView:touch.view];
//        if(CGRectContainsPoint(_stubbleView.frame, location)
//           {
//               NSLog(@"IT WORKED!!! YES!!!");
//           }
//    }
//}

- (void)handleTap:(UITapGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        UIView *tappedView;
        for (UIView *someBubbleView in _bubbleViews)
        {
            CGPoint touchPoint = [sender locationInView:self.view];
            
            if (CGRectContainsPoint(someBubbleView.frame, touchPoint))
            {
                tappedView = someBubbleView;
                CABasicAnimation *boundsAnim = [CABasicAnimation animationWithKeyPath:@"bounds"];
                boundsAnim.fromValue = [NSValue valueWithCGRect:tappedView.layer.bounds];
                boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(20, 20, 70, 70)];
                boundsAnim.duration = 0.2;
                [tappedView.layer addAnimation:boundsAnim forKey:@"bounds"];
                
                // Change the actual data value in the layer to the final value.
                tappedView.layer.bounds = CGRectMake(20, 20, 0, 0);
                NSLog(@"Pop! %@", tappedView);
                self.view.backgroundColor = [UIColor redColor];

            }
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end