//
//  AlbumDetailsVC.m
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "AlbumDetailsVC.h"
#import "Utils.h"
#import "AlbumDetailConfigurator.h"

@interface AlbumDetailsVC ()

@end

@implementation AlbumDetailsVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    [self configure];
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    [self configure];
    
    return self;
}

// Configure AlbumDetails Architecture
- (void)configure
{
    [AlbumDetailConfigurator configureAlbumDetail:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Notify Presenter for Album details
    [_presenter getAlbumDetails];
}

// Show the details of selected album
- (void)renderAlbumData:(AlbumEntity *)album{
    [Utils makeViewCornerBound:self.storeButton];
    self.title = album.strName;
    self.albumTitleLabel.text = album.strName;
    self.artistTitleLabel.text = album.strArtistName;
    self.copyrightLabel.text = album.strCopyRight;
    self.releaseDateLabel.text = album.strReleaseDate;
    artistURL = album.strArtistURL;
    NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",album.strAlbumImageURL]];
    NSString * albumId = album.strAlbumId;
    if (albumId) {
        if (imageURL) {
            
            __block UIImage *image = nil;
            
            image = [Utils getImageFromCache:albumId];
            // Check if an image available in the cache
            if (image) {
                [self.albumImage setImage:image];
            }else{
                /*
                 Image not found in cache.
                 Here we are converting image from url
                 And save image in the Cache for future use.
                 */
                __weak __typeof(self)weakSelf = self;    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
                    __strong __typeof(weakSelf)strongSelf = weakSelf;
                    image = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageURL]];
                    if (image) {
                        
                        [[NSOperationQueue mainQueue] addOperationWithBlock:^(void){
                            [strongSelf.albumImage setImage:image];
                        }];

                        // Saving an image in the cache
                        [Utils saveImageInCache:image uniquePath:albumId urlImg:[NSString stringWithFormat:@"%@",album.strAlbumImageURL]];
                    }
                });
            }
        }
    }
    
}

// Redirect to the iTunes store to show Artist Page
- (IBAction)actionOnStoreLink:(id)sender {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@",artistURL]];
    [application openURL:URL options:@{} completionHandler:^(BOOL success) {
        if (success) {
            //Able to open the URL Successfully
        }
    }];
    
}


@end
