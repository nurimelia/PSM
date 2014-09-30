//
//  DataModel.h
//  Maintenance Tracker for iOS
//
//  Created by Kalai Chelvan on 26/4/14.
//  Copyright (c) 2013 Kalai Chelvan. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong) NSMutableArray *lists;

- (void)saveChecklists;

- (int)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist:(int)index;

- (void)sortChecklists;


+ (int)nextChecklistItemId;


@end
