//
//  AlbumPresenter.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "AlbumViewProtocol.h"
#import "AlbumInteractorProtocol.h"
#import "AlbumInteractorOutPutProtocol.h"
#import "AlbumWireframeProtocol.h"
 

@interface AlbumPresenter : NSObject<AlbumInteractorOutPutProtocol>

@property (weak, nonatomic) id<AlbumViewProtocol> view;
@property (nonatomic) id<AlbumInteractorProtocol> interactor;
@property (nonatomic) id<AlbumWireframeProtocol> albumWireFrame;
@property (strong, nonatomic) AlbumEntity* selectedAlbum;

- (void)startFetchingAlbum;
- (void)showAlbumDetailswith:(AlbumEntity*)album andViewController:(UIViewController *)view;
@end

 
