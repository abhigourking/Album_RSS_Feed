//
//  AlbumViewProtocol.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AlbumViewProtocol <NSObject>

// Protocol to handle success result of API
- (void)showAlbumList:(NSMutableArray*)resultArray;

// Protocol to handle error result of API and show Alert 
- (void)showErrorMessageWithTitle:(NSString*)title message:(NSString*)message;
@end

 
