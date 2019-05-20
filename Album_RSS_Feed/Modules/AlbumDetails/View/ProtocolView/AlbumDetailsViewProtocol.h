//
//  AlbumDetailsViewProtocol.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AlbumEntity.h"

@protocol AlbumDetailsViewProtocol <NSObject>
// Get album details to show on Detail screen
-(void)renderAlbumData:(AlbumEntity *)album;
@end

 
