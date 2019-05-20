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
    
    if([dict valueForKey:@"name"] != nil){
        album.strName = dict [@"name"];
    }
    if([dict valueForKey:@"releaseDate"] != nil){
        album.strReleaseDate = [dict valueForKey:@"releaseDate"];
    }
    if([dict valueForKey:@"copyright"] != nil){
        album.strCopyRight = [dict valueForKey:@"copyright"];
    }
    if([dict valueForKey:@"artistName"] != nil){
        album.strArtistName = [dict valueForKey:@"artistName"];
    }
    if([dict valueForKey:@"artistId"] != nil){
        album.strArtistId = [dict valueForKey:@"artistId"];
    }
    if([dict valueForKey:@"url"] != nil){
        album.strArtistURL = [dict valueForKey:@"artistUrl"];
    }
    if([dict valueForKey:@"artworkUrl100"] != nil){
        album.strAlbumImageURL = [dict valueForKey:@"artworkUrl100"];
    }
    if([dict valueForKey:@"id"] != nil){
        album.strAlbumId = [dict valueForKey:@"id"];
    }
    
    return album; // Append album to an array
}

@end
