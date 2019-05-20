//
//  AGReachabilityManager.m
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "AGReachabilityManager.h"
#import "Reachability.h"

@implementation AGReachabilityManager

#pragma mark - Default Manager

+ (AGReachabilityManager *)sharedManager {
    static AGReachabilityManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[self alloc] init];
    });
    return _sharedManager;
}

#pragma mark - Memory Management
- (void)dealloc {
    // Stop Notifier
    if (_reachability) {
        [_reachability stopNotifier];
    }
}

#pragma mark - Class Method
// This method will check that a network is reachable or not
+ (BOOL)isReachable {
    return [[[AGReachabilityManager sharedManager] reachability] isReachable];
}

#pragma mark - Private Initialization
- (id)init {
    self = [super init];
    
    if (self) {
        self.reachability = [Reachability reachabilityForInternetConnection];
        // Start Monitoring
        [self.reachability startNotifier];
    }
    
    return self;
}

@end

