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

@interface TYTimelineViewController ()
@property (strong, nonatomic) id authorizationNeededObserver;
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
}


#pragma mark - PrivateMethods

- (void)showProfile {
  TYUserProfileViewController *userProfileController = [[TYUserProfileViewController alloc] initWithNibName:@"TYUserProfileViewController" bundle:[NSBundle mainBundle]];
  [self.navigationController pushViewController:userProfileController animated:YES];
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self.authorizationNeededObserver];
}

#pragma mark - PrivateMethods
- (void)presentLogin {
  
}

#pragma mark - Protocols
#pragma mark UITableViewDelegate


#pragma mark UITableViewDataSource

@end
