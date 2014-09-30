//
//  ListViewController.h
//  Maintenance Tracker for iOS
//
//  Created by Kalai Chelvan on 26/4/14.
//  Copyright (c) 2013 Kalai Chelvan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemDetailViewController.h"
#import "GADBannerView.h"


@class Checklist;

@interface ListViewController : UITableViewController   <ItemDetailViewControllerDelegate>
{
    // Declare one as an instance variable
    GADBannerView *bannerView_;

}


@property (nonatomic, strong) Checklist *checklist;
@property (strong, nonatomic) IBOutlet UIButton *button;

@property (nonatomic, strong) IBOutlet UIWebView* adMobView;



-(IBAction) addItem:(id)sender;


@end
