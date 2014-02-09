//
//  TYTweet.m
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYTweet.h"

@interface TYTweet ()
@property (strong, nonatomic) NSDictionary* source;
@end

@implementation TYTweet
- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.source = dictionary;
  }
  return self;
}

- (NSDictionary*)user {
  return [self.source objectForKey:@"user"];
}

- (NSString*)name {
  return [[self user] objectForKey:@"name"];
}

- (NSString*)text {
  return [self.source objectForKey:@"text"];
}

- (NSString*)profileImage {
  return [[self user] objectForKey:@"profile_image_url"];
}

- (NSString*)userDescription {
  return [[self user] objectForKey:@"description"];
}

- (NSString*)screenName {
  return [[self user] objectForKey:@"screen_name"];
}
@end
