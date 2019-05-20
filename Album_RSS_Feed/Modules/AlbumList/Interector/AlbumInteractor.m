//
//  AlbumInteractor.m
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "AlbumInteractor.h"
#import "Constants.h"
#import "AlbumEntity.h"
#import "AGReachabilityManager.h"
#import "AlbumEntityParser.h"

@implementation AlbumInteractor

/*
 API call using NSURLSession
 to fetch Album List
 */
- (void)fetchAlbum{
    // Check for network connection
    if([AGReachabilityManager isReachable]){
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setHTTPMethod:@"GET"];
        [request setURL:[NSURL URLWithString:ALBUM_URL]];
        
        __weak __typeof(self)weakSelf = self;
        
        [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
          ^(NSData * _Nullable data,
            NSURLResponse * _Nullable response,
            NSError * _Nullable error) {
              
              __strong __typeof(weakSelf)strongSelf = weakSelf;
              if (error == nil){
                  
                  NSError *e = nil;
                  
                  // Parse json to an Array
                  NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingMutableContainers error: &e];
                  
                  // Parse Album from result json
                  AlbumEntityParser *parser = [[AlbumEntityParser alloc] init];
                  NSMutableArray *albums = [[NSMutableArray alloc] initWithArray:[parser parseJson: jsonResponse]];
                  
                  if (albums.count > 0) {
                      // Found some albums send a success response to show on view
                      [strongSelf.presenter albumFetchSuccess: albums];
                  }
                  else
                  {
                      // No album found send a eror response to show an alert on view
                      [strongSelf.presenter albumFetchFailedWithTitle:ALERT_TITLE_ERROR message:ALERT_ERROR_MESSAGE_NO_RESULT];
                  }
                  
              }
              else{
                  // Error in API call. Send a eror response to show an alert on view
                  [strongSelf.presenter albumFetchFailedWithTitle:ALERT_TITLE_ERROR message:ALERT_ERROR_MESSAGE];
              }
          }] resume];
    }else{
          // No Network found. Send a eror response to show an alert on view
        [self.presenter albumFetchFailedWithTitle:ALERT_TITLE_ERROR message:NO_INTERNET_CONNECTION_MESSAGE];
    }
}
@end
