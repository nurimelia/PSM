//
//  Checklist.h
//  Maintenance Tracker for iOS
//
//  Created by Kalai Chelvan on 26/4/14.
//  Copyright (c) 2013 Kalai Chelvan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject <NSCoding>


@property (nonatomic, copy) NSString *category;
@property (nonatomic, strong) NSMutableArray *items;
@property (nonatomic, copy) NSString *iconName;

- (int)countUncheckedItems;


@end
