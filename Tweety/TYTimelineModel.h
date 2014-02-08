//
//  TYTimelineModel.h
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString* kTYTimelineAuthorizationNeededNotification = @"kTYTimelineAuthorizationNeededNotification";
@class TYTweet;

/**
 *  Model for the Authenticated user's timeline. If the user hasn't provided any authorization yet, the classs will send a kTYTimelineAuthorizationNeededNotification whenever any information is requested.
 */
@interface TYTimelineModel : NSObject

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
@end
