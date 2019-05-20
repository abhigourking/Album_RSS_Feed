//
//  AlbumEntityParser.m
//  Album_RSS_Feed
//
//  Created by Ashish Shah on 5/19/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "AlbumEntityParser.h"
#import "AlbumView.h"

@implementation AlbumEntityParser

-(NSArray *)parseJson:(NSDictionary *)json {
    
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    
    NSArray *results = [[json valueForKey:@"feed"] valueForKey:@"results"];
    for (NSDictionary *dict in results) {
        AlbumEntity *album = [self parseAlbumJson: dict];
        [resultArray addObject: album];
    }
    return resultArray;
}

-(AlbumEntity *)parseAlbumJson:(NSDictionary *)dict {
    
    AlbumEntity *album = [[AlbumEntity alloc] init];
    
    if(dict[@"name"] != nil){
        album.strName = dict [@"name"];
    }
    if(dict[@"releaseDate"] != nil){
        album.strReleaseDate = dict[@"releaseDate"];
    }
    if(dict[@"copyright"] != nil){
        album.strCopyRight = dict[@"copyright"];
    }
    if(dict[@"artistName"] != nil){
        album.strArtistName = dict[@"artistName"];
    }
    if(dict[@"artistId"] != nil){
        album.strArtistId = dict[@"artistId"];
    }
    if(dict[@"url"] != nil){
        album.strArtistURL = dict[@"artistUrl"];
    }
    if(dict[@"artworkUrl100"] != nil){
        album.strAlbumImageURL = dict[@"artworkUrl100"];
    }
    if(dict[@"id"] != nil){
        album.strAlbumId = dict[@"id"];
    }
    
    return album; // Append album to an array
}

@end
