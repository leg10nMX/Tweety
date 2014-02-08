//
//  TYTwitter.h
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TYTwitterAPI.h"


/**
 *  Interface for the Twitter API. It uses the ACAccountStore to save user's credentials, and the Social Framework to log the user in, then comunicates with the REST API asynchronously.
 */
@interface TYTwitter : NSObject <TYTwitterAPI>


/**
 *  Returns the singleton instance for this class or creates if it doesn't exist.
 *
 *  @return the singleton instance for this class.
 */
+ (instancetype)sharedInstance;
@end
