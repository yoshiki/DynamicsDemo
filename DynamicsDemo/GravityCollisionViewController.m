//
//  GravityCollisionViewController.m
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/17.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "GravityCollisionViewController.h"

@interface GravityCollisionViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIGravityBehavior *gravityBehavior;
@property (nonatomic, strong) UICollisionBehavior *collisionBehavior;
@property (nonatomic, assign) CGPoint targetOriginCenter;
@property (nonatomic, assign) CGPoint otherOriginCenter;

@end

@implementation GravityCollisionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Gravity & Collision";
    
    _targetOriginCenter = _targetView.center;
    _otherOriginCenter = _otherView.center;
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (IBAction)startWithEverything:(id)sender
{
    if (_gravityBehavior != nil || _collisionBehavior != nil) return;
    [self startWithMode:UICollisionBehaviorModeEverything];
}

- (IBAction)startWithBoundaries:(id)sender
{
    if (_gravityBehavior != nil || _collisionBehavior != nil) return;
    [self startWithMode:UICollisionBehaviorModeBoundaries];
}

- (IBAction)startWithItems:(id)sender
{
    if (_gravityBehavior != nil || _collisionBehavior != nil) return;
    [self startWithMode:UICollisionBehaviorModeItems];
}

- (void)startWithMode:(UICollisionBehaviorMode)mode
{
    if (_animator.running) return;
    _collisionBehavior = [[UICollisionBehavior alloc] initWithItems:@[ _targetView, _otherView ]];
    _collisionBehavior.collisionMode = mode;
    _collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collisionBehavior];
    
    _gravityBehavior = [[UIGravityBehavior alloc] initWithItems:@[ _targetView ]];
    _gravityBehavior.angle = DEGREES_TO_RADIANS(90);
    _gravityBehavior.magnitude = 5.0f;
    [_animator addBehavior:_gravityBehavior];
}

- (IBAction)reset:(id)sender
{
    [_animator removeAllBehaviors];
    _gravityBehavior = nil;
    _collisionBehavior = nil;
    [UIView animateWithDuration:0.2f animations:^{
        _targetView.center = _targetOriginCenter;
        _targetView.transform = CGAffineTransformIdentity;
        _otherView.center = _otherOriginCenter;
        _otherView.transform = CGAffineTransformIdentity;
    }];
}

@end
