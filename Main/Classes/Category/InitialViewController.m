//
//  InitialViewController.m
//  Video Trimming Tool for iOS
//
//  Created by Kalai Chelvan on 18/5/14.
//  Copyright (c) 2014 Kalai Chelvan. All rights reserved.
//

#import "InitialViewController.h"

@interface InitialViewController ()

@end

@implementation InitialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];


    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"Left" style:UIBarButtonItemStylePlain target:self action:@selector(openVideoController)];
    
    self.navigationItem.leftBarButtonItem = left;

}


-(void)openVideoController
{
    
    [self performSegueWithIdentifier:@"open" sender:nil]; //call trim segue

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"open"]) {
        
        
    UINavigationController *navigationController = segue.destinationViewController;
    controller = (CategoryViewController *)navigationController.topViewController;
   
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
