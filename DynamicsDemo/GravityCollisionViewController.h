//
//  GravityCollisionViewController.h
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/17.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GravityCollisionViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *targetView;
@property (weak, nonatomic) IBOutlet UIImageView *otherView;

- (IBAction)startWithEverything:(id)sender;
- (IBAction)startWithBoundaries:(id)sender;
- (IBAction)startWithItems:(id)sender;
- (IBAction)reset:(id)sender;

@end
