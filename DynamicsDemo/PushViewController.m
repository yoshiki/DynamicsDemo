//
//  PushViewController.m
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/17.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIPushBehavior *pushBehavior;
@property (nonatomic, assign) CGPoint originCenter;

@end

@implementation PushViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Push";
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    _originCenter = _targetView.center;
}

- (IBAction)start:(id)sender
{
    if (_animator.running || _pushBehavior != nil) return;
    _pushBehavior = [[UIPushBehavior alloc] initWithItems:@[ _targetView ] mode:UIPushBehaviorModeInstantaneous];

    float offsetX = rand() % (int)CGRectGetWidth(_targetView.frame);
    float offsetY = rand() % (int)CGRectGetHeight(_targetView.frame);
    UIOffset offset = UIOffsetMake(offsetX, offsetY); // Pushed point from center
    [_pushBehavior setTargetOffsetFromCenter:offset forItem:_targetView];
    float directX = ((rand() % 10 / 10.0f) - 0.5f) * 3.0f; // -1.5 〜 1.5
    float directY = ((rand() % 10 / 10.0f) - 0.5f) * 3.0f; // -1.5 〜 1.5
    _pushBehavior.pushDirection = CGVectorMake(directX, directY); // Pushed direction
    [_animator addBehavior:_pushBehavior];
}

- (IBAction)reset:(id)sender
{
    [_animator removeAllBehaviors];
    _pushBehavior = nil;
    [UIView animateWithDuration:0.2f animations:^{
        _targetView.center = _originCenter;
        _targetView.transform = CGAffineTransformIdentity;
    }];
}

@end
