//
//  TYViewController.m
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYTimelineViewController.h"
#import "TYTimelineModel.h"

@interface TYTimelineViewController ()
@property (strong, nonatomic) id authorizationNeededObserver;
@end

@implementation TYTimelineViewController
#pragma mark - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  __weak TYTimelineViewController* _self = self;
  self.authorizationNeededObserver = [[NSNotificationCenter defaultCenter] addObserverForName:kTYTimelineAuthorizationNeededNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
    [_self presentLogin];
  }];
}

- (void)didReceiveMemoryWarning
{
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
#pragma mark UITableViewDelegate


#pragma mark UITableViewDataSource

@end
