//
//  SnapViewController.h
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/19.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnapViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *targetView;

- (IBAction)start00:(id)sender;
- (IBAction)start05:(id)sender;
- (IBAction)start10:(id)sender;
- (IBAction)reset:(id)sender;

@end
