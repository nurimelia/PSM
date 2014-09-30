//
//  Checklist.m
//  Maintenance Tracker for iOS
//
//  Created by Kalai Chelvan on 26/4/14.
//  Copyright (c) 2013 Kalai Chelvan. All rights reserved.
//

#import "ChecklistItem.h"
#import "Checklist.h"

@implementation Checklist

@synthesize category;
@synthesize items;
@synthesize iconName;


- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super init])) {
        self.category = [aDecoder decodeObjectForKey:@"Category"];
        self.items = [aDecoder decodeObjectForKey:@"Items"];
        self.iconName = [aDecoder decodeObjectForKey:@"IconName"];
    }
    return self;
}


- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.category forKey:@"Category"];
    [aCoder encodeObject:self.items forKey:@"Items"];
    [aCoder encodeObject:self.iconName forKey:@"IconName"];
}



- (id)init
{
    if ((self = [super init])) {
        self.items = [[NSMutableArray alloc] initWithCapacity:20];
        self.iconName = @"Trips";
    }
    return self;
}


- (int)countUncheckedItems
{
    int count = 0;
    for (ChecklistItem *item in self.items) {
        if (!item.checked) {
            count += 1;
        }
    }
    return count;
}

- (NSComparisonResult)compare:(Checklist *)otherChecklist
{
    return [self.category localizedCaseInsensitiveCompare:otherChecklist.category];
}


@end
