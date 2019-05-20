//
//  AlbumInteractorOutPutProtocol.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlbumEntity.h"

@protocol AlbumInteractorOutPutProtocol <NSObject>

// Protocol to handle success result of API
- (void)albumFetchSuccess:(NSMutableArray *)albumModelArray;

// Protocol to handle error result of API and show Alert 
- (void)albumFetchFailedWithTitle:(NSString*)title message:(NSString*)message;
@end

 
