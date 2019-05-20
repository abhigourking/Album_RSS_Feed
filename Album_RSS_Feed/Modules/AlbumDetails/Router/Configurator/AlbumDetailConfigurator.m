//
//  AlbumDetailConfigurator.m
//  Album_RSS_Feed
//
//  Created by Abhishek on 19/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "AlbumDetailConfigurator.h"
#import "AlbumDetailsPresenter.h"

@implementation AlbumDetailConfigurator

/*
 This Method will configure the Architecture for AlbumDetail Module
 */
+(void)configureAlbumDetail:(AlbumDetailsVC *)view
{
    AlbumDetailsPresenter *presenter = [[AlbumDetailsPresenter alloc] init];
    view.presenter = presenter;
    presenter.view = (id<AlbumDetailsViewProtocol>) view;
}
@end
