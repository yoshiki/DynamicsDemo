//
//  GravityViewController.h
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/17.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GravityViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *targetView;

- (IBAction)goUp:(id)sender;
- (IBAction)goDown:(id)sender;
- (IBAction)goRight:(id)sender;
- (IBAction)goLeft:(id)sender;
- (IBAction)reset:(id)sender;

@end
