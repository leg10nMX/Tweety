//
//  TYAccount.m
//  Tweety
//
//  Created by leg10n on 2/8/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYAccount.h"
#import "TYTwitter.h"

@interface TYAccount ()
@property (strong, nonatomic)NSDictionary *source;
@end
@implementation TYAccount
- (void)fetchUserProfileWithCompletionBlock:(void (^)())block {
  __weak TYAccount *_self = self;
  [[TYTwitter sharedInstance] fetchUserProfileWithCompletionBlock:^(NSDictionary *settings) {
    _self.source = settings;
    block();
  }];
}

- (NSString*)name {
  return [self.source objectForKey:@"name"];
}

- (NSString*)screenName {
  return [self.source objectForKey:@"screen_name"];
}

- (NSString*)location {
  return [self.source objectForKey:@"location"];
}

- (NSString*)userDescription {
  return [self.source objectForKey:@"description"];
}

- (NSString*)profileImage {
  return [self.source objectForKey:@"profile_image_url"];
}
@end
