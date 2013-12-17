//
//  AttachmentPushViewController.m
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/17.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "AttachmentPushViewController.h"

@interface AttachmentPushViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;
@property (nonatomic, strong) UIPushBehavior *pushBehavior;
@property (nonatomic, assign) CGPoint originCenter;

@end

@implementation AttachmentPushViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Attachment & Push";
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    _originCenter = _targetView.center;
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:gesture];
}

- (void)handleGesture:(UIPanGestureRecognizer *)gesture
{
    CGPoint p = [gesture locationInView:self.view];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            UIOffset offset = UIOffsetMake(p.x - _targetView.center.x, p.y - _targetView.center.y);
            _attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:_targetView offsetFromCenter:offset attachedToAnchor:p];
            [_animator addBehavior:_attachmentBehavior];
            break;
        }
        case UIGestureRecognizerStateChanged:
            _attachmentBehavior.anchorPoint = p;
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            [_animator removeBehavior:_attachmentBehavior];
            _attachmentBehavior = nil;
            
            CGPoint velocity = [gesture velocityInView:self.view];
            CGFloat magnitude = sqrtf(powf(velocity.x, 2) + powf(velocity.y, 2));
            if (magnitude > 1500) {
                _pushBehavior = [[UIPushBehavior alloc] initWithItems:@[ _targetView ] mode:UIPushBehaviorModeInstantaneous];
                UIOffset offset = UIOffsetMake(p.x - _targetView.center.x, p.y - _targetView.center.y);
                [_pushBehavior setTargetOffsetFromCenter:offset forItem:_targetView];
                _pushBehavior.pushDirection = CGVectorMake(velocity.x / 200, velocity.y / 200);
                [_animator addBehavior:_pushBehavior];
            } else {
                [UIView animateWithDuration:0.2f animations:^{
                    _targetView.center = _originCenter;
                    _targetView.transform = CGAffineTransformIdentity;
                }];
            }
            break;
        }
        default:
            break;
    }
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
