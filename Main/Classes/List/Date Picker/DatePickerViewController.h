//
//  DatePickerViewController.h
//  Maintenance Tracker for iOS
//
//  Created by Kalai Chelvan on 26/4/14.
//  Copyright (c) 2013 Kalai Chelvan. All rights reserved.
//

#import <UIKit/UIKit.h>


@class DatePickerViewController;

@protocol DatePickerViewControllerDelegate <NSObject>

- (void)datePickerDidCancel:(DatePickerViewController *)picker;
- (void)datePicker:(DatePickerViewController *)picker didPickDate:(NSDate *)date;

@end

@interface DatePickerViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIDatePicker *datePicker;
@property (nonatomic, weak) id <DatePickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSDate *date;

- (IBAction)cancel;
- (IBAction)done;
- (IBAction)dateChanged;

@end
