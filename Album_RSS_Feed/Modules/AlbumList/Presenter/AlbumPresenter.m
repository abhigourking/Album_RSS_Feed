//
//  AlbumPresenter.m
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "AlbumPresenter.h"

@implementation AlbumPresenter

#pragma mark - Presenter to View
// Notify an error to View
- (void)albumFetchFailedWithTitle:(NSString *)title message:(NSString *)message {
    [_view showErrorMessageWithTitle:title message:message];
}

// Notify a success API call to show results on View
- (void)albumFetchSuccess:(nonnull NSMutableArray *)albumModelArray {
    [_view showAlbumList:albumModelArray];
}

#pragma mark - Presenter to Interactor

// Notify Interactor to call an API
- (void)startFetchingAlbum{
    [_interactor fetchAlbum];
}

#pragma mark - Presenter to Router
// Notify Router to call show Album Detail Screen with selected album data
- (void)showAlbumDetailswith:(AlbumEntity*)album andViewController:(UIViewController *)view{
    self.selectedAlbum = album;
}


@end
