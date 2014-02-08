//
//  TYTimelineModel.m
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYTimelineModel.h"
#import "TYTweet.h"
#import "TYTwitter.h"
@interface TYTimelineModel ()
@property (strong,nonatomic) NSArray *tweets;
@end

@implementation TYTimelineModel

- (NSArray*)tweets {
  void (^receivedTweets)(NSArray *tweetArray) = ^(NSArray *tweetArray){
    self.tweets = tweetArray;
    [[NSNotificationCenter defaultCenter] postNotificationName:kTYTweetsReceivedNotification object:nil];
  };
  if (!_tweets) {
    if ([[TYTwitter sharedInstance] hasAuthorization]) {
      [[TYTwitter sharedInstance] fetchTimelineWithCompletionBlock:receivedTweets];
    } else {
      [[TYTwitter sharedInstance] requestAuthorizationWithCompletionBlock:^(BOOL granted, NSError *error) {
        if (granted) {
          [[TYTwitter sharedInstance] fetchTimelineWithCompletionBlock:receivedTweets];
        }
      }];
    }
    return nil;
  }
  return _tweets;
}

- (NSInteger)count {
  return [self.tweets count];
}

- (TYTweet*)tweetAtIndex:(NSInteger)index {
  return [[TYTweet alloc] initWithDictionary:[self.tweets objectAtIndex:index]];
}

@end
