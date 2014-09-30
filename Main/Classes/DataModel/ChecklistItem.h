//
//  ChecklistItem.h
//  Maintenance Tracker for iOS
//
//  Created by Kalai Chelvan on 26/4/14.
//  Copyright (c) 2013 Kalai Chelvan. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface ChecklistItem : NSObject <NSCoding>

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *notes;
@property (nonatomic, copy) NSString *make;
@property (nonatomic, copy) NSString *numberPlate;
@property (nonatomic, copy) NSString *serviceFrequency;
@property (nonatomic, assign) BOOL checked;
@property (nonatomic, copy) NSDate *dueDate;
@property (nonatomic, copy) NSDate *nextServiceDate;
@property (nonatomic, assign) BOOL shouldRemind;
@property (nonatomic, assign) int itemId;
@property (nonatomic, copy) UIImage *image;



- (void)toggleChecked;

- (void)scheduleNotification;




@end
