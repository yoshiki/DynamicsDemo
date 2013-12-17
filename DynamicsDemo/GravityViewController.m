//
//  GravityViewController.m
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/17.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "GravityViewController.h"

@interface GravityViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, assign) CGPoint originCenter;

@end

@implementation GravityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Gravity";
    
    _originCenter = _targetView.center;

    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (IBAction)goUp:(id)sender
{
    if (_animator.running || _gravityBehavior != nil) return;
    _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[ _targetView ]];
    _gravityBehavior.angle = DEGREES_TO_RADIANS(270);
    _gravityBehavior.magnitude = 5.0f;
    [_animator addBehavior:_gravityBehavior];
}

- (IBAction)goDown:(id)sender
{
    if (_animator.running || _gravityBehavior != nil) return;
    _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[ _targetView ]];
    _gravityBehavior.angle = DEGREES_TO_RADIANS(90);
    _gravityBehavior.magnitude = 5.0f;
    [_animator addBehavior:_gravityBehavior];
}

- (IBAction)goRight:(id)sender
{
    if (_animator.running || _gravityBehavior != nil) return;
    _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[ _targetView ]];
    _gravityBehavior.angle = DEGREES_TO_RADIANS(0);
    _gravityBehavior.magnitude = 5.0f;
    [_animator addBehavior:_gravityBehavior];
}

- (IBAction)goLeft:(id)sender
{
    if (_animator.running || _gravityBehavior != nil) return;
    _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[ _targetView ]];
    _gravityBehavior.angle = DEGREES_TO_RADIANS(180);
    _gravityBehavior.magnitude = 5.0f;
    [_animator addBehavior:_gravityBehavior];
}

- (IBAction)reset:(id)sender
{
    [_animator removeBehavior:_gravityBehavior];
    _gravityBehavior = nil;
    [UIView animateWithDuration:0.2f animations:^{
        _targetView.center = _originCenter;
        _targetView.transform = CGAffineTransformIdentity;
    }];
}

@end
