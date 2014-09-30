//
//  CategoryViewController.h
//  Maintenance Tracker for iOS
//
//  Created by Kalai Chelvan on 26/4/14.
//  Copyright (c) 2013 Kalai Chelvan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CategoryDetailViewController.h"
#import "DataModel.h"
#import "GADBannerView.h"




@interface CategoryViewController : UITableViewController <ListDetailViewControllerDelegate, UINavigationControllerDelegate>{
    
    
    
    // Declare one as an instance variable
    GADBannerView *bannerView_;

    
    
}

@property (nonatomic, strong) DataModel *dataModel;

@property (nonatomic, strong) IBOutlet UIWebView* adMobView;



@end
