//
//  AlbumTableCell.m
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "AlbumTableCell.h"

@implementation AlbumTableCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

/*
 This will initialize the Album Cell set theme and Album text/image to show
 */
- (AlbumTableCell*) initializeCell: (AlbumTableCell*) cell withAlbumDetails:(AlbumEntity*)album{
    NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",album.strAlbumImageURL]];
    [Utils makeViewCornerBound:self.albumImage]; // Make Album Image Rounded
    self.albumTitleLabel.text = album.strName;
    self.artistTitleLabel.text = album.strArtistName;
    NSString * albumId = album.strAlbumId;
    if (albumId) {
        if (imageURL) {
            
            __block UIImage *image = nil;
           
            [self.imageIndicatorView startAnimating];
            [self.albumImage setImage:nil];
            image = [Utils getImageFromCache:albumId];
            // Check if image available in the cache
            if (image) {
                [self.albumImage setImage:image];
                [self.imageIndicatorView stopAnimating];
            }else{
                /*
                 Image not found in cache.
                 Here we are converting image from url
                 And save image in the Cache for future use.
                */
                    __weak __typeof(self)weakSelf = self;
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                     __strong __typeof(weakSelf)strongSelf = weakSelf;
                    image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
                    if (image) {
                        
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^(void){
                            [strongSelf.albumImage setImage:image];
                            [strongSelf.imageIndicatorView stopAnimating];
                        }];
                        // Saving an image in the cache 
                        [Utils saveImageInCache:image uniquePath:albumId urlImg:[NSString stringWithFormat:@"%@",album.strAlbumImageURL]];
                    }
                });
            }
        }
    }
    return cell;
}

@end

