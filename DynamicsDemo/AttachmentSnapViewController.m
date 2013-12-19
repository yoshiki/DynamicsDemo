//
//  AttachmentSnapViewController.m
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/19.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "AttachmentSnapViewController.h"

@interface AttachmentSnapViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;
@property (nonatomic, strong) UISnapBehavior *snapBehavior;
@property (nonatomic, assign) CGPoint originCenter;

@end

@implementation AttachmentSnapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Attachment & Snap";
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    
    _originCenter = _targetView.center;
    
    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:gesture];
}

- (void)handleGesture:(UIPanGestureRecognizer *)gesture
{
    [_animator removeBehavior:_snapBehavior];
            
    CGPoint p = [gesture locationInView:self.view];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            [_animator removeAllBehaviors];
            
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
            
            _snapBehavior = [[UISnapBehavior alloc] initWithItem:_targetView snapToPoint:_originCenter];
            _snapBehavior.damping = 0.1f;
            [_animator addBehavior:_snapBehavior];
            break;
        }
        default:
            break;
    }
}

@end
