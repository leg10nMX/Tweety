//
//  TYUserProfileViewController.m
//  Tweety
//
//  Created by leg10n on 2/8/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYUserProfileViewController.h"
#import "TYAccount.h"
#import "UIImageView+WebCache.h"
#import "TYUserTweetsViewController.h"

@interface TYUserProfileViewController ()
@property (strong, nonatomic)TYAccount *model;
@end

@implementation TYUserProfileViewController
#pragma mark - Lifecycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.model = [[TYAccount alloc] init];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
  __weak TYUserProfileViewController *_self = self;
  [self.model fetchUserProfileWithCompletionBlock:^{
    [_self updateUI];
  }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Methods
- (void)updateUI {
  [self.profileImage setImageWithURL:[NSURL URLWithString:[self.model profileImage]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
    
  }];
  [self.name setText:[self.model name]];
  [self.screenName setText:[NSString stringWithFormat:@"@%@",[self.model screenName]]];
  [self.description setText:[self.model userDescription]];
  
  [self.view setNeedsLayout];
}

#pragma mark - IBActions
- (IBAction)showTweets:(id)sender {
  TYUserTweetsViewController *controllet = [[TYUserTweetsViewController alloc] initWithNibName:@"TYTweetFeedViewController" bundle:[NSBundle mainBundle]];
  [self.navigationController pushViewController:controllet animated:YES];
}
@end
