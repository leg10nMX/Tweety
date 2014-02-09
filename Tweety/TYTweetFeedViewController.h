//
//  TYViewController.h
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TYTweetSource;
@interface TYTweetFeedViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) TYTweetSource *model;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
