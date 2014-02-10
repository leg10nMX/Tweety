//
//  TYTweetSource.m
//  Tweety
//
//  Created by leg10n on 2/9/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYTweetSource.h"
#import "TYTweet.h"
#import "TYTwitter.h"

@interface TYTweetSource ()

@property (strong,nonatomic) NSArray *tweets;
@end

@implementation TYTweetSource

- (NSString*)maxId {
  NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"id" ascending:NO];
  NSArray *tweets = [self.tweets sortedArrayUsingDescriptors:@[sortDescriptor]];
  return [[tweets lastObject] objectForKey:@"id_str"];
}

- (void)reloadTimeline {
  self.tweets = nil;
}

- (void)updateTweets:(NSArray*)tweetArray {
  if (!_tweets) { //since the first time the model receives a notification to update the tweets array, it would be nil and trigger another fetch, so it's being checked directly from the ivar instead.
    self.tweets = tweetArray;
  } else {
    self.tweets = [self.tweets arrayByAddingObjectsFromArray:tweetArray];
  }
  [[NSNotificationCenter defaultCenter] postNotificationName:kTYTweetsReceivedNotification object:nil];
}

- (NSArray*)tweets {
  if (!_tweets) {
    if ([[TYTwitter sharedInstance] hasAuthorization]) {
      [self fetchFromSourceBeforeId:nil];
    } else {
      [[TYTwitter sharedInstance] requestAuthorizationWithCompletionBlock:^(BOOL granted, NSError *error) {
        if (granted) {
          [self fetchFromSourceBeforeId:nil];
        }
      }];
    }
    return nil;
  }
  return _tweets;
}

- (void)fetchFromSourceBeforeId:(NSString*)maxId {
  [NSException raise:@"TYMethodNotImplemented" format:@"The abstract method must be implemented in subclasses"];
}

- (NSInteger)count {
  return [self.tweets count];
}

- (TYTweet*)tweetAtIndex:(NSInteger)index {
  if ([self.tweets count] && index == [self.tweets count] - 1) {
    [self fetchFromSourceBeforeId:[self maxId]];
  }
  return [[TYTweet alloc] initWithDictionary:[self.tweets objectAtIndex:index]];
}
@end
