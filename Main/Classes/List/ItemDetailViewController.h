//
//  ItemDetailViewController.h
//  E-Report for iOS
//
//  Created by Nur Imelia on 08/03/15.
//  Copyright (c) 2015 Nur Imelia. All rights reserved.
//

#import "DatePickerViewController.h"
#import <UIKit/UIKit.h>
#import "UIImage+Resize.h"

#import "GADBannerView.h"



//A protocol doesn’t have instance variables and it doesn’t implement any of the methods it declares. It just says: any object that conforms to this protocol must implement methods X, Y and Z.



///declare delagate methods

@class ItemDetailViewController;
@class ChecklistItem;




/// We pass the creted information to listviewcontrolelr using delegate method.

@protocol ItemDetailViewControllerDelegate <NSObject>


///This method declares when user tap on the cancel button, it will dismiss the item detail view controller presenting without saving the data

- (void)itemDetailViewControllerDidCancel:(ItemDetailViewController *)controller;



///This method pass the relevant "added" information such as category name, icon to listview controller

- (void)itemDetailViewController:(ItemDetailViewController *)controller
didFinishAddingItem:(ChecklistItem *)item;


///This method pass the relevant "edited" information such as category name, icon to listview controller

- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item;

@end



/// confirm that textfield, datpicker and actionsheet delegates to self

@interface ItemDetailViewController : UITableViewController <UINavigationControllerDelegate, UITextFieldDelegate, DatePickerViewControllerDelegate, UIImagePickerControllerDelegate, UIActionSheetDelegate> {
    
    UIActionSheet *sheet;

    GADBannerView *bannerView_;

    
}



/// create properties
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UITextView *notesField;
@property (strong, nonatomic) IBOutlet UITextField *makeField;
@property (strong, nonatomic) IBOutlet UITextField *numberPlateField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;
@property (nonatomic, weak) id <ItemDetailViewControllerDelegate> delegate;
@property (nonatomic, strong) ChecklistItem *itemToEdit;
@property (nonatomic, strong) IBOutlet UISwitch *switchControl;
@property (nonatomic, strong) IBOutlet UILabel *dueDateLabel;
@property (nonatomic, strong) IBOutlet UILabel *nextServiceDateLabel;
@property (nonatomic, strong) IBOutlet UILabel *serviceFrequencyField;
@property (strong, nonatomic) IBOutlet UIImageView *imageField;


@property (nonatomic, strong) UIPopoverController *popOver;

@property (nonatomic, strong) IBOutlet UIWebView* adMobView;


///create IBAction methods
- (IBAction)cancel;
- (IBAction)done;
- (IBAction)frequency:(id)sender;


- (IBAction)switchChanged:(UISwitch *)sender;



@end