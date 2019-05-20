//
//  Constants.h
//  Album_RSS_Feed
//
//  Created by Abhishek on 16/05/19.
//  Copyright © 2019 abhishek. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

/*
    This Class have all the texts and the required theme for the app. You can change the theme and any text from here only.
    Source URL : https://rss.itunes.apple.com/en-us
    GIT URL : https://github.com/abhigourking/Album_RSS_Feed.git
 */

#define ALBUM_URL @"https://rss.itunes.apple.com/api/v1/us/apple-music/top-albums/all/50/explicit.json"

#define SCREEN_TITLE @"Album's RSS Feed"
#define ALBUM_CELL_IDENTIFIER @"AlbumCellIdentifier"

#define CORNER_ROUNDED_RADIUS_VIEW 5
#define CORNER_BORDER_COLOR_WIDTH 1.0f

#define STORYBOARD_NAME @"Main"
#define ALBUM_DETAIL_IDENTIFIER @"AlbumDetailsVC"
#define ALBUM_VIEW_IDENTIFIER @"AlbumView"

#define ALERT_VIEW_FONT_NAME @"HelveticaNeue"
#define ALERT_VIEW_TITLE_FONT_SIZE 20
#define ALERT_VIEW_MESSAGE_FONT_SIZE 15

#define ALERT_TITLE_ERROR @"Error"
#define ALERT_ERROR_MESSAGE_NO_RESULT @"No Result Found. Please try after some time."
#define ALERT_ERROR_MESSAGE @"Error Occured. Please try after some time."
#define NO_INTERNET_CONNECTION_MESSAGE  @"The Internet connection appears to be offline"
#define ALERT_VIEW_OK_BUTTON @"OK"

#endif
