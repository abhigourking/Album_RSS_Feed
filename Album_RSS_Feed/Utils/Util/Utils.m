//
//  Utils.m
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "Utils.h"
#import "Constants.h"

@implementation Utils

// This method is to Save an image in cache
+(void) saveImageInCache:(UIImage *) image uniquePath:(NSString*)uniquePath  urlImg:(NSString*)urlImg{
    
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSData * binaryImageData = UIImagePNGRepresentation(image);
    if(binaryImageData != nil){
        [binaryImageData writeToFile:[basePath stringByAppendingPathComponent:uniquePath] atomically:YES];
    }
}

// This method is to Get an Image from cache
+ (UIImage *)getImageFromCache:(NSString*)uniquePath{
    
    UIImage *image;
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    uniquePath = [basePath stringByAppendingString:uniquePath];
    if(uniquePath != nil){
        // Check for the cached image availability
        if([[NSFileManager defaultManager] fileExistsAtPath: uniquePath])
        {
            image = [UIImage imageWithContentsOfFile: uniquePath]; // This is a cached image
        }
        return image;
    }
    return nil; // No cached image found on given path
}

// This method is to make view's corner rounded
+(void) makeViewCornerBound:(UIView*)view{
    
    view.layer.cornerRadius = CORNER_ROUNDED_RADIUS_VIEW;
    view.layer.borderColor = [UIColor clearColor].CGColor;
    view.layer.borderWidth = CORNER_BORDER_COLOR_WIDTH;
    view.layer.masksToBounds = YES;
    
}

@end
