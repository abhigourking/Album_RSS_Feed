//
//  AlbumDetailsPresenter.m
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "AlbumDetailsPresenter.h"

@implementation AlbumDetailsPresenter

// Notify View with the album data to show
- (void)getAlbumDetails{
    [_view renderAlbumData:self.album];
}

@end
