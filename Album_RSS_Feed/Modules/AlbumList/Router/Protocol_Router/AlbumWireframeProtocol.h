//
//  AlbumWireframeProtocol.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AlbumWireframeProtocol <NSObject>

// Protocol to perform transition from AlbumView to another view
- (void)routeToAlbumDetail:(UIStoryboardSegue*)segue;

@end

 
