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

- (NSString*)maxId {
  NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"id" ascending:NO];
  NSArray *tweets = [self.tweets sortedArrayUsingDescriptors:@[sortDescriptor]];
  return [tweets firstObject];
}

- (void)updateTweets:(NSArray*)tweetArray {
    if (!self.tweets) {
      self.tweets = tweetArray;
    } else {
      self.tweets = [self.tweets arrayByAddingObjectsFromArray:tweetArray];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kTYTweetsReceivedNotification object:nil];
}

- (NSArray*)tweets {
  if (!_tweets) {
    if ([[TYTwitter sharedInstance] hasAuthorization]) {
      [[TYTwitter sharedInstance] fetchTimelineBefore:nil completionBlock:^(NSArray *tweetArray) {
        [self updateTweets:tweetArray];
      }];
    } else {
      [[TYTwitter sharedInstance] requestAuthorizationWithCompletionBlock:^(BOOL granted, NSError *error) {
        if (granted) {
          [[TYTwitter sharedInstance] fetchTimelineBefore:nil completionBlock:^(NSArray *tweetArray) {
            [self updateTweets:tweetArray];
          }];
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
  if ([self.tweets count] && index == [self.tweets count] - 1) {
    [[TYTwitter sharedInstance] fetchTimelineBefore:[self maxId] completionBlock:^(NSArray *tweetArray) {
      [self updateTweets:tweetArray];
    }];
  }
  return [[TYTweet alloc] initWithDictionary:[self.tweets objectAtIndex:index]];
}

@end
