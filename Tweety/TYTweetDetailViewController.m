//
//  TYTweetDetailViewController.m
//  Tweety
//
//  Created by leg10n on 2/8/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYTweetDetailViewController.h"
#import "UIImageView+WebCache.h"
#import "TYTweet.h"

@interface TYTweetDetailViewController ()

@property (strong, nonatomic) TYTweet* tweet;
@end

@implementation TYTweetDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil
               bundle:(NSBundle *)nibBundleOrNil
                tweet:(TYTweet *)tweet {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.tweet = tweet;
    }
    return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.profileImage setImageWithURL:[NSURL URLWithString:[self.tweet profileImage]] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType) {
    
  }];
  
  [self.name setText:[self.tweet name]];
  [self.text setText:[self.tweet text]];
  [self.screenName setText:[NSString stringWithFormat:@"@%@",[self.tweet screenName]]];
  [self.description setText:[self.tweet userDescription]];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
