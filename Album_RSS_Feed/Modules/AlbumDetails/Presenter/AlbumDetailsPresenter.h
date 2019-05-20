//
//  AlbumDetailsPresenter.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlbumDetailsViewProtocol.h"
 
@interface AlbumDetailsPresenter : NSObject

@property (strong, nonatomic) AlbumEntity *album;
@property (weak, nonatomic) id<AlbumDetailsViewProtocol> view;

- (void)getAlbumDetails;
@end

 
