//
//  TYTimelineViewController.m
//  Tweety
//
//  Created by leg10n on 2/9/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYTimelineViewController.h"
#import "TYUserProfileViewController.h"
#import "TYTimelineModel.h"
#import "BAAlertView.h"
#import "TYTwitter.h"

@interface TYTimelineViewController ()

@end

@implementation TYTimelineViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
    self.model = [[TYTimelineModel alloc] init];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Profile" style:UIBarButtonItemStyleBordered target:self action:@selector(showProfile)];
  
  self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Write Tweet" style:UIBarButtonItemStyleBordered target:self action:@selector(tweet)];
}


#pragma mark - PrivateMethods
- (void)tweet {
  __weak TYTimelineViewController *_self = self;
  BAAlertView *alert = [[BAAlertView alloc] initWithTitle:@"Write a tweet" message:@"Enter the text" cancelButtonTitle:@"Cancel" cancelBlock:nil otherButtonTitles:@[@"Tweet!"] otherButtonBlocks:@[^(BAAlertView *alertView) {
    
    if (![[TYTwitter sharedInstance] postTweet:[[alertView textFieldAtIndex:0] text] inResponseTo:nil error:nil completionBlock:^(NSDictionary *settings) {
      [_self.model reloadTimeline];
      [_self.tableView reloadData];
    }]) {
      [[[UIAlertView alloc] initWithTitle:@"Error"
                                  message:@"Tweet too long"
                                 delegate:nil
                        cancelButtonTitle:@"OK"
                        otherButtonTitles:nil] show];
    }
  }]];
  alert.alertViewStyle = UIAlertViewStylePlainTextInput;
  [alert show];
}

- (void)showProfile {
  TYUserProfileViewController *userProfileController = [[TYUserProfileViewController alloc] initWithNibName:@"TYUserProfileViewController" bundle:[NSBundle mainBundle]];
  [self.navigationController pushViewController:userProfileController animated:YES];
}

@end
