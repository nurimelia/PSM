//
//  IconPickerViewController.m
//  Maintenance Tracker for iOS
//
//  Created by Kalai Chelvan on 26/4/14.
//  Copyright (c) 2013 Kalai Chelvan. All rights reserved.
//

#import "IconPickerViewController.h"

@interface IconPickerViewController ()

@end

@implementation IconPickerViewController {
    NSArray *icons;
  
}
@synthesize delegate;



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
    
    self.title = @"Choose Icon";


    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:
                                     [UIImage imageNamed:@"ipad-BG.png"]];


    
   // [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    
   // [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    
    
    icons = [NSArray arrayWithObjects:
             @" No Icon",
             @"Appointments",
             @"Birthdays",
             @"Button-info",
             @"Chores",
             @"Computer",
             @"Electronics",
             @"Folder",
             @"Home",
             @"Trips",

             nil];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    icons = nil;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [icons count];
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IconCell"];
                             NSString *icon = [icons objectAtIndex:indexPath.row];
                             cell.textLabel.text = icon;
                             cell.imageView.image = [UIImage imageNamed:icon];
                             return cell;
    
    
}





#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath
                                                                    *)indexPath
{
    NSString *iconName = [icons objectAtIndex:indexPath.row];
    [self.delegate iconPicker:self didPickIcon:iconName];
}

@end
