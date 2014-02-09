//
//  TYAccount.h
//  Tweety
//
//  Created by leg10n on 2/8/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  YTAccount represents the current user's account.
 */
@interface TYAccount : NSObject

- (NSString*)name;
- (NSString*)screenName;
- (NSString*)location;
- (NSString*)userDescription;
- (NSString*)profileImage;
- (void)fetchUserProfileWithCompletionBlock:(void (^)())block;
@end
