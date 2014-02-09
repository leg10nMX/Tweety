//
//  TYUserTweets.m
//  Tweety
//
//  Created by leg10n on 2/9/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYUserTweets.h"
#import "TYTwitter.h"

@implementation TYUserTweets

- (void)fetchFromSourceBeforeId:(NSString*)maxId {
  [[TYTwitter sharedInstance] fetchTweetsForUserScreenName:[[TYTwitter sharedInstance] screenName] beforeTweetId:maxId completionBlock:^(NSArray *tweetArray) {
    [self updateTweets:tweetArray];
  }];
}
@end
