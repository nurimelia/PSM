//
//  CategoryDetailViewController.h
//  Maintenance Tracker for iOS
//
//  Created by Kalai Chelvan on 26/4/14.
//  Copyright (c) 2013 Kalai Chelvan. All rights reserved.
//


#import "IconPickerViewController.h"
#import <UIKit/UIKit.h>
#import "GADBannerView.h"


@class CategoryDetailViewController;
@class Checklist;


@protocol ListDetailViewControllerDelegate <NSObject>


- (void)listDetailViewControllerDidCancel:(CategoryDetailViewController *)controller;

- (void)listDetailViewController:(CategoryDetailViewController *)controller didFinishAddingChecklist:(Checklist *)checklist;

- (void)listDetailViewController:(CategoryDetailViewController *)controller didFinishEditingChecklist:(Checklist *)checklist;

@end


@interface CategoryDetailViewController : UITableViewController <
UITextFieldDelegate, IconPickerViewControllerDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
 
    
    // Declare one as an instance variable
    GADBannerView *bannerView_;

    
    
}

@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (nonatomic, strong) IBOutlet UITextField *textField;
@property (nonatomic, strong) IBOutlet UITextField *numberPlateTextField;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *doneBarButton;

@property (nonatomic, weak) id <ListDetailViewControllerDelegate> delegate;
@property (nonatomic, strong) Checklist *checklistToEdit;

@property (nonatomic, strong) IBOutlet UIWebView* adMobView;


- (IBAction)cancel;

- (IBAction)done;


@end