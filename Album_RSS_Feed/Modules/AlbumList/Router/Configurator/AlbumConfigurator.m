//
//  AlbumConfigurator.m
//  Album_RSS_Feed
//
//  Created by Abhishek on 19/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "AlbumConfigurator.h"
#import "AlbumInteractor.h"
#import "AlbumPresenter.h"
#import "AlbumWireframe.h"

@implementation AlbumConfigurator
/*
    This Method will configure the Architecture for AlbumList Module
 */
+(void)configureAlbumList:(AlbumView *)view
{
        AlbumPresenter *presenter = [[AlbumPresenter alloc] init];
        AlbumInteractor *interactor = [[AlbumInteractor alloc] init];
        AlbumWireframe *albumWireframe = [[AlbumWireframe alloc] init];
        view.presenter = presenter;
        presenter.view = (id<AlbumViewProtocol>) view;
        presenter.albumWireFrame = (id<AlbumWireframeProtocol>) albumWireframe;
        presenter.interactor = (id<AlbumInteractorProtocol>) interactor;
        interactor.presenter = (id<AlbumInteractorOutPutProtocol>) presenter;
}

@end
