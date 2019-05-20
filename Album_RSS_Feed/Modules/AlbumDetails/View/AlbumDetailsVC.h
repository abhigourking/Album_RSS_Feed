//
//  AlbumDetailsVC.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumDetailsRouter.h"
#import "AlbumDetailsPresenter.h"

@interface AlbumDetailsVC : UIViewController<AlbumDetailsViewProtocol>
{
    NSString *artistURL;
}
@property (strong, nonatomic) AlbumDetailsPresenter *presenter;

@property (weak, nonatomic) IBOutlet UIImageView *albumImage;
@property (weak, nonatomic) IBOutlet UILabel *albumTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *artistTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *copyrightLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UIButton *storeButton;
- (IBAction)actionOnStoreLink:(id)sender;

@end

 

