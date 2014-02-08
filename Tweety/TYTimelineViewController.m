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

@interface TYTimelineViewController ()
@property (strong, nonatomic) id authorizationNeededObserver;
@end

@implementation TYTimelineViewController
#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
  
  __weak TYTimelineViewController* _self = self;
  self.authorizationNeededObserver = [[NSNotificationCenter defaultCenter] addObserverForName:kTYTimelineAuthorizationNeededNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
    [_self presentLogin];
  }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self.authorizationNeededObserver];
}

#pragma mark - PrivateMethods
- (void)presentLogin {
  
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
- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *cellIdentifier = @"YTTimelineCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
  }
  TYTweet *tweet = [self.model tweetAtIndex:[indexPath row]];
  [cell.textLabel setText:[NSString stringWithFormat:@"%@", tweet.name]];
  [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@", tweet.text]];
  return cell;
}
@end
