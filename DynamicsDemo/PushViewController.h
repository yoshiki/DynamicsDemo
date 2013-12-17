//
//  PushViewController.h
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/17.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PushViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *targetView;

- (IBAction)start:(id)sender;
- (IBAction)reset:(id)sender;

@end
