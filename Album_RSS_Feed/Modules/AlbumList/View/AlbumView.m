//
//  AlbumView.m
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#import "AlbumView.h"
#import "AlbumPresenter.h"
#import "Constants.h"
#import "AlbumConfigurator.h"

@import AGDialog;

@interface AlbumView ()

@end

@implementation AlbumView

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

// Configure AlbumList Architecture 
- (void)configure
{
    [AlbumConfigurator configureAlbumList:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = SCREEN_TITLE;
    
    // Enable the activity indicator until we get the resposne from API
    [self.activityIndicator startAnimating];
    
    // API call using presenter object
    [self.presenter startFetchingAlbum];
}

#pragma mark - Error Handler
/*
 This will show an Alert when something wrong happen in this view
 like API call error response or No response or No network.
 */
- (void)showErrorMessageWithTitle:(NSString *)title message:(NSString *)message{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.activityIndicator stopAnimating];
        
        // This is an Library created internally. We are using this library to show an Alert.
        AGDialogView *alertView = [AGDialogView new];
        
        [alertView getAlertWithTitle:title message:message onView:self.view withCompletion:^{
            NSLog(@"Alert Ok Button Clicked");}];
        
        [alertView updateAlertColorWithTitleTextColor:[UIColor blackColor] messageTextColor:[UIColor grayColor] buttonTextColor:[UIColor whiteColor]];
        
        alertView.alertTitleFont = [UIFont fontWithName:ALERT_VIEW_FONT_NAME size:ALERT_VIEW_TITLE_FONT_SIZE];
        
        alertView.alertMessageFont = [UIFont fontWithName:ALERT_VIEW_FONT_NAME size:ALERT_VIEW_MESSAGE_FONT_SIZE];
        
    });
}

#pragma mark - Success Result Handler
/*
 This method will be called when we get the Album List seccessfully
 This will reload the Album List Table to see the fetched records.
 */
- (void)showAlbumList:(NSMutableArray *)resultArray {
    self.albumArray = [[NSMutableArray alloc]initWithArray:resultArray];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // do work here
        [self.activityIndicator stopAnimating];
        [self.albumTableView reloadData];
    });
}

#pragma mark - Table View DataSources
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = ALBUM_CELL_IDENTIFIER;
    AlbumTableCell * cell;
    cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    AlbumEntity *album = [self.albumArray objectAtIndex:indexPath.row];
    [cell initializeCell:cell withAlbumDetails:album];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albumArray.count;
}

#pragma mark - Table View Delegates
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.presenter showAlbumDetailswith:[self.albumArray objectAtIndex:indexPath.row] andViewController:self];
    [self performSegueWithIdentifier:@"toAlbumDetails" sender:self];
}

#pragma mark - PerformSegue To Album Details
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.presenter.albumWireFrame routeToAlbumDetail:segue];
}

@end

