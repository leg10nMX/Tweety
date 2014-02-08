//
//  TYTwitterAPI.h
//  Tweety
//
//  Created by leg10n on 2/8/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Protocol to describe the essential elements of a Twitter Framework
 */
@protocol TYTwitterAPI <NSObject>
- (void)requestAuthorizationWithCompletionBlock:(void (^)(BOOL granted, NSError *error))block;
@end
