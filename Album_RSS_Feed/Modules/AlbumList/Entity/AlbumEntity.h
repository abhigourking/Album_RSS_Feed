//
//  AlbumEntity.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <Foundation/Foundation.h>
 

@interface AlbumEntity : NSObject

@property(strong, nonatomic) NSString * strArtistId;
@property(strong, nonatomic) NSString * strArtistName;
@property(strong, nonatomic) NSString * strCopyRight;
@property(strong, nonatomic) NSString * strName;
@property(strong, nonatomic) NSString * strReleaseDate;
@property(strong, nonatomic) NSString * strArtistURL;
@property(strong, nonatomic) NSString * strAlbumImageURL;
@property(strong, nonatomic) NSString * strAlbumId;

@end
 

