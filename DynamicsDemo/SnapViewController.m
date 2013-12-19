//
//  SnapViewController.m
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/19.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "SnapViewController.h"

@interface SnapViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UISnapBehavior *snapBehavior;
@property (nonatomic, assign) CGPoint originCenter;

@end

@implementation SnapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Snap";
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    _originCenter = _targetView.center;
}

- (IBAction)start00:(id)sender
{
    [self startWithDamping:0.0f];
}

- (IBAction)start05:(id)sender
{
    [self startWithDamping:0.5f];
}

- (IBAction)start10:(id)sender
{
    [self startWithDamping:1.0f];
}

- (void)startWithDamping:(CGFloat)damping
{
    if (_animator.running || _snapBehavior != nil) return;
    CGRect bounds = [[UIScreen mainScreen] bounds];
    CGPoint point = CGPointMake(rand() % (int)bounds.size.width, rand() % (int)bounds.size.height);
    _snapBehavior = [[UISnapBehavior alloc] initWithItem:_targetView snapToPoint:point];
    _snapBehavior.damping = damping;
    [_animator addBehavior:_snapBehavior];
}

- (IBAction)reset:(id)sender
{
    [_animator removeAllBehaviors];
    _snapBehavior = nil;
    [UIView animateWithDuration:0.2f animations:^{
        _targetView.center = _originCenter;
        _targetView.transform = CGAffineTransformIdentity;
    }];
}

@end
