//
//  TYTimelineModel.h
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYTweetSource.h"

/**
 *  Model for the Authenticated user's timeline. If the user hasn't provided any authorization yet, the classs will send a kTYTimelineAuthorizationNeededNotification whenever any information is requested.
 */
@interface TYTimelineModel : TYTweetSource

@interface TYTimelineModel : NSObject
- (BOOL)hasAuthorization;
@end
