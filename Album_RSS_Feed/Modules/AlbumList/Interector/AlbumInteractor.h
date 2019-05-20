//
//  AlbumInteractor.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AlbumInteractorOutPutProtocol.h"
#import "AlbumEntity.h"

@interface AlbumInteractor : NSObject
@property (weak, nonatomic) id<AlbumInteractorOutPutProtocol> presenter;
@property (nonatomic) AlbumEntity* entity;

// API call to fetch Album Lists
- (void)fetchAlbum;
@end
 
