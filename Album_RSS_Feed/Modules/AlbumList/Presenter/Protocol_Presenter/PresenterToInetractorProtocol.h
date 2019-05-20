//
//  PresenterToInetractorProtocol.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PresenterToInetractorProtocol <NSObject>
// Protol to notify interactor for API call
- (void)fetchAlbumData;
@end

 
