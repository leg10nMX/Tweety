//
//  TYTweet.h
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Represents a Tweet, this class acts as the DTO and wrapper for data retrieved from the server.
 */
@interface TYTweet : NSObject

/**
 *  Initializes the instance with the given dictionary.
 *
 *  @param dictionary the NSDictionary returned by the Twitter API
 *
 *  @return An initalized instance representing a Tweet.
 */
- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

/**
 *  The display name of the author of the Tweet
 */
@property (strong, nonatomic) NSString *name;

/**
 *  The text of the tweet
 */
@property (strong, nonatomic) NSString *text;

/**
 *  The URL of the profile Image as string.
 */
@property (strong, nonatomic) NSString *profileImage;

@property (strong, nonatomic) NSString *screenName;

@property (strong, nonatomic) NSString *userDescription;
@end
