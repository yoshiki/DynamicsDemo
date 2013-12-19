//
//  TableViewController.m
//  DynamicsDemo
//
//  Created by Yoshiki Kurihara on 2013/12/17.
//  Copyright (c) 2013年 Yoshiki Kurihara. All rights reserved.
//

#import "TableViewController.h"
#import "AttachmentViewController.h"
#import "GravityViewController.h"
#import "GravityCollisionViewController.h"
#import "PushViewController.h"
#import "AttachmentPushViewController.h"
#import "SnapViewController.h"
#import "AttachmentSnapViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureCell:(UITableViewCell *)cell atIndex:(NSInteger)index
{
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    switch (index) {
        case 0:
            cell.textLabel.text = @"Attachemnt";
            break;
        case 1:
            cell.textLabel.text = @"Gravity";
            break;
        case 2:
            cell.textLabel.text = @"Gravity & Collision";
            break;
        case 3:
            cell.textLabel.text = @"Push";
            break;
        case 4:
            cell.textLabel.text = @"Attachment & Push";
            break;
        case 5:
            cell.textLabel.text = @"Snap";
            break;
        case 6:
            cell.textLabel.text = @"Attachment & Snap";
            break;
        default:
            break;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [self configureCell:cell atIndex:indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0: {
            AttachmentViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"attachment"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 1: {
            GravityViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"gravity"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 2: {
            GravityCollisionViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"gravity_collision"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 3: {
            PushViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"push"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 4: {
            AttachmentPushViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"attachment_push"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 5: {
            SnapViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"snap"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        case 6: {
            AttachmentSnapViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"attachment_snap"];
            [self.navigationController pushViewController:vc animated:YES];
            break;
        }
        default:
            break;
    }
}

@end
