//
//  AlbumTableCell.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumEntity.h"
#import "Utils.h"
 

@interface AlbumTableCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *albumTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *artistTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *releaseDateLabel;
@property (nonatomic, weak) IBOutlet UIImageView *albumImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *imageIndicatorView;

- (AlbumTableCell*) initializeCell: (AlbumTableCell*) cell withAlbumDetails:(AlbumEntity*)album;


@end

 
