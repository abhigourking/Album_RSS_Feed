//
//  AlbumView.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumViewProtocol.h"
#import "AlbumTableCell.h"
#import "AlbumEntity.h"

@class AlbumPresenter;
@class AlbumWireframe;


@interface AlbumView : UIViewController<UITableViewDelegate,UITableViewDataSource,AlbumViewProtocol>

@property (strong, nonatomic) AlbumPresenter *presenter;
@property (strong, nonatomic) NSMutableArray *albumArray;
@property (weak, nonatomic) IBOutlet UITableView *albumTableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end


