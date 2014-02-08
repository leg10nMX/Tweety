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
 *  The display name of the author of the Tweet
 */
@property (strong, nonatomic) NSString *name;

/**
 *  The text of the tweet
 */
@property (strong, nonatomic) NSString *text;
@end
