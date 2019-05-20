//
//  Album_RSS_FeedTests.m
//  Album_RSS_FeedTests
//
//  Created by Abhishek on 19/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

@class AlbumView;

#import <XCTest/XCTest.h>
#import <Foundation/Foundation.h>
#import "AlbumView.h"

@interface Album_RSS_FeedTests : XCTestCase
@property (strong, nonatomic) AlbumView *albumVC;
@end

@implementation Album_RSS_FeedTests

- (void)setUp
{
    [super setUp];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.albumVC = (AlbumView*)[storyboard instantiateViewControllerWithIdentifier:@"AlbumView"];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.albumVC = nil;
    [super tearDown];
}

#pragma mark - View loading tests
-(void)testThatViewLoads
{
    XCTAssertNotNil(self.albumVC.view, @"View not initiated properly");
}

- (void)testParentViewHasTableViewSubview
{
    NSArray *subviews = self.albumVC.view.subviews;
    XCTAssertTrue([subviews containsObject:self.albumVC.albumTableView], @"View does not have a table subview");
}

- (void)testFetchAlbumAPI
{
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:@"https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/50/explicit.json"]];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:
      ^(NSData * _Nullable data,
        NSURLResponse * _Nullable response,
        NSError * _Nullable error)
      {
          XCTAssertNil(error, @"dataTaskWithURL error %@", error);
          
          if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
              NSInteger statusCode = [(NSHTTPURLResponse *) response statusCode];
              XCTAssertEqual(statusCode, 200, @"status code was not 200; was %ld", (long)statusCode);
              
          }
          
          XCTAssert(data, @"data nil");
          
          // do additional tests on the contents of the `data` object here, if you want
          
          // when all done, signal the semaphore
          
          dispatch_semaphore_signal(semaphore);
      }] resume];
    
    long rc = dispatch_semaphore_wait(semaphore, dispatch_time(DISPATCH_TIME_NOW, 10.0 * NSEC_PER_SEC));
    XCTAssertEqual(rc, 0, @"network request timed out");
}

#pragma mark - UITableView tests
- (void)testThatViewConformsToUITableViewDataSource
{
    XCTAssertTrue([self.albumVC conformsToProtocol:@protocol(UITableViewDataSource) ], @"View does not conform to UITableView datasource protocol");
}

- (void)testThatViewConformsToUITableViewDelegate
{
    XCTAssertTrue([self.albumVC conformsToProtocol:@protocol(UITableViewDelegate) ], @"View does not conform to UITableView delegate protocol");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

