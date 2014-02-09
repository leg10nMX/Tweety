//
//  TYTwitter.m
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYTwitter.h"
#import "TYTwitteriOS.h"

typedef NS_ENUM(NSInteger, TYTwitterFramework) {
  TYTwitterFrameworkiOS = 0,
  TYTwitterFrameworkCustom
};

const TYTwitterFramework useFramework = TYTwitterFrameworkiOS;

@interface TYTwitter ()
@property (strong, nonatomic) id<TYTwitterAPI>api;
@end

@implementation TYTwitter

- (void)requestAuthorizationWithCompletionBlock:(void (^)(BOOL granted, NSError *error))block {
  [self.api requestAuthorizationWithCompletionBlock:block];
}

- (BOOL)hasAuthorization {
  return [self.api hasAuthorization];
}

- (void)fetchTimelineBefore:(NSString*)maxId completionBlock:(void (^)(NSArray *))block {
  [self.api fetchTimelineBefore:maxId completionBlock:block];
}

- (void)fetchUserProfileWithCompletionBlock:(void (^)(NSDictionary *))block {
  [self.api fetchUserProfileWithCompletionBlock:block];
}

+ (instancetype)sharedInstance {
  static TYTwitter *sharedInstance = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[TYTwitter alloc] init];
    switch (useFramework) {
      case TYTwitterFrameworkiOS:
        sharedInstance.api = [[TYTwitteriOS alloc] init];
        break;
      default:
        break;
    }
  });
  return sharedInstance;
}
@end
