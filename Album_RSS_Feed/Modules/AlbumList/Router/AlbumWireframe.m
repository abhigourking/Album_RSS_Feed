//
//  AlbumWireframe.m
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "AlbumWireframe.h"
#import "AlbumInteractor.h"
#import "AlbumEntity.h"
#import "AlbumPresenter.h"
#import "AlbumView.h"
#import "AlbumDetailsVC.h"
#import "Constants.h"

@interface AlbumWireframe() {
    AlbumPresenter *presenter;
    AlbumInteractor *interactor;
    AlbumEntity *entity;
    AlbumDetailsRouter *albumDetailWireframe;
}

@end

@implementation AlbumWireframe


#pragma mark - Route Operations
/*
    This method will push AlbumView to the AlbumDetailsView
    with the details of selected Album to show on AlbumDetail screen.
 */
- (void)routeToAlbumDetail:(UIStoryboardSegue*)segue
{
    AlbumView *sourceView = (AlbumView*) segue.sourceViewController;
    AlbumDetailsVC *view = (AlbumDetailsVC*) segue.destinationViewController;
    view.presenter.album = sourceView.presenter.selectedAlbum;
    //[self performSegueWithIdentifier:@"toAlbumDetails" sender:self];
}

@end
