//
//  Utils.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

 

@interface Utils : NSObject

// This method is to Save an image in cache
+ (void) saveImageInCache:(UIImage *)image uniquePath:(NSString*)uniquePath urlImg:(NSString*)urlImg;

// This method is to Get an Image from cache
+ (UIImage *)getImageFromCache:(NSString*)uniquePath;

// This method is to make view's corner rounded
+ (void)makeViewCornerBound:(UIView*)view;

@end

 
