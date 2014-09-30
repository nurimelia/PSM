//
//  UIImage+Resize.h
//  Maintenance Tracker for iOS
//
//  Created by Kalai Chelvan on 26/4/14.
//  Copyright (c) 2013 Kalai Chelvan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage_Resize : UIImage

+ (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)newSize;

@end
