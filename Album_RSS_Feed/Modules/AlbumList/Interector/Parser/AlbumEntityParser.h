//
//  AlbumEntityParser.h
//  Album_RSS_Feed
//
//  Created by Ashish Shah on 5/19/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AlbumEntityParser : NSObject
-(NSArray *)parseJson:(NSDictionary *)json;
@end
