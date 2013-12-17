//
//  AttachmentViewController.m
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/17.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "AttachmentViewController.h"

@interface AttachmentViewController ()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@property (nonatomic, strong) UIAttachmentBehavior *attachmentBehavior;
@property (nonatomic, assign) CGPoint originCenter;

@end

@implementation AttachmentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Attachment";

    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    UIPanGestureRecognizer *gesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                              action:@selector(handleGesture:)];
    [self.view addGestureRecognizer:gesture];
    
    _originCenter = _targetView.center;
}

- (void)handleGesture:(UIPanGestureRecognizer *)gesture
{
    CGPoint p = [gesture locationInView:self.view];
    switch (gesture.state) {
        case UIGestureRecognizerStateBegan: {
            UIOffset offset = UIOffsetMake(p.x - _targetView.center.x, p.y - _targetView.center.y);
            _attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:_targetView
                                                            offsetFromCenter:offset
                                                            attachedToAnchor:p];
            [_animator addBehavior:_attachmentBehavior];
            break;
        }
        case UIGestureRecognizerStateChanged: {
            _attachmentBehavior.anchorPoint = p;
            break;
        }
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            [_animator removeBehavior:_attachmentBehavior];
            
            [UIView animateWithDuration:0.2f animations:^{
                _targetView.center = _originCenter;
                _targetView.transform = CGAffineTransformIdentity;
            }];
            break;
        }
        default:
            break;
    }
}

@end
