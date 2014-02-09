//
//  TYViewController.m
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYTimelineViewController.h"
#import "TYTimelineModel.h"
#import "TYTweet.h"
#import "UIImageView+WebCache.h"
#import "TYTweetDetailViewController.h"
#import "TYUserProfileViewController.h"

@interface TYTimelineViewController ()
@property (strong, nonatomic) id tweetsUpdateReceivedObserver;
@end

@implementation TYTimelineViewController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
  
  __weak TYTimelineViewController* _self = self;
  self.tweetsUpdateReceivedObserver = [[NSNotificationCenter defaultCenter] addObserverForName:kTYTweetsReceivedNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
    dispatch_async(dispatch_get_main_queue(), ^{
      [_self.tableView reloadData];
    });
  }];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Profile" style:UIBarButtonItemStyleBordered target:self action:@selector(showProfile)];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self.tweetsUpdateReceivedObserver];
}

#pragma mark - PrivateMethods

- (void)showProfile {
  TYUserProfileViewController *userProfileController = [[TYUserProfileViewController alloc] initWithNibName:@"TYUserProfileViewController" bundle:[NSBundle mainBundle]];
  [self.navigationController pushViewController:userProfileController animated:YES];
}

#pragma mark - Protocols
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.model count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  TYTweet *tweet = [self.model tweetAtIndex:[indexPath row]];
  TYTweetDetailViewController *controller = [[TYTweetDetailViewController alloc] initWithNibName:@"TYTweetDetailViewController" bundle:[NSBundle mainBundle] tweet:tweet];
  [self.navigationController pushViewController:controller animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  return 90;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *cellIdentifier = @"YTTimelineCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                  reuseIdentifier:cellIdentifier];
    [cell.textLabel setFont:[UIFont systemFontOfSize:14]];
    
    [cell.detailTextLabel setFont:[UIFont systemFontOfSize:12]];
    [cell.detailTextLabel setNumberOfLines:5];
    [cell.detailTextLabel setLineBreakMode:NSLineBreakByWordWrapping];
  }
  TYTweet *tweet = [self.model tweetAtIndex:[indexPath row]];
  [cell.textLabel setText:[NSString stringWithFormat:@"%@", tweet.name]];
  [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@", tweet.text]];
  __weak UITableViewCell *_cell = cell;
  [cell.imageView setImageWithURL:[NSURL URLWithString:[tweet profileImage]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
    [_cell setNeedsLayout];
  }];
  return cell;
}
@end
