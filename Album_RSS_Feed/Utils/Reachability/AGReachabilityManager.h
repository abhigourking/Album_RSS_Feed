//
//  AGReachabilityManager.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
  This is a Singleton class to check the network connection
*/
@class Reachability;

@interface AGReachabilityManager : NSObject

@property (strong, nonatomic) Reachability *reachability;

#pragma mark - Shared Manager
+ (AGReachabilityManager *)sharedManager;

#pragma mark - Class Method
+ (BOOL)isReachable;

@end
 
