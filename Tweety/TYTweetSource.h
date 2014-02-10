//
//  TYTweetSource.h
//  Tweety
//
//  Created by leg10n on 2/9/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Foundation/Foundation.h>
static NSString *kTYTweetsReceivedNotification = @"kTYTweetsReceivedNotification";

@class TYTweet;

/**
 *  Superclass to define the common methods in tweet soruces, you must override the - (void)fetchFromSourceBeforeId:(NSString*)maxId; in order to implement the source of the tweets
 */
@interface TYTweetSource : NSObject

/**
 *  Returns the number of tweets in memory.
 *
 *  @return An NSInteger accounting for the number of tweets in memory.
 */
- (NSInteger)count;

/**
 *  Returns the TYTweet object at the requested index.
 *
 *  @param index The index of the requested tweet.
 *
 *  @return An TYTweet for the requested index.
 */
- (TYTweet*)tweetAtIndex:(NSInteger)index;

/**
 *  callback method to receive and process the tweets
 *
 *  @param tweetArray the array of tweets received from the API.
 */
- (void)updateTweets:(NSArray*)tweetArray;

/**
 *  Abstract method to specify the tweet source, this method must be overriden. The implementation of this method should call - (void)updateTweets:(NSArray*)tweetArray; method to notify about the results.
 *
 *  @param maxId the max_id parameter for the tweet retrieval.
 */
- (void)fetchFromSourceBeforeId:(NSString*)maxId;

/**
 *  Discards the current Timeline and forces a reload, idealli this method would cache the existing tweets and load the new ones. not enough time right now...
 */
- (void)reloadTimeline;
@end
