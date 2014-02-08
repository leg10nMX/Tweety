//
//  TYTwitteriOS.m
//  Tweety
//
//  Created by leg10n on 2/8/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Accounts/Accounts.h>
#import <Social/Social.h>

#import "TYTwitteriOS.h"

@interface TYTwitteriOS ()
@property (strong, nonatomic) ACAccount* account;
@end

@implementation TYTwitteriOS {
  dispatch_queue_t queue;
}
- (instancetype)init {
  if (self = [super init]) {
    queue = dispatch_queue_create("BAYouTubeModel.DispatchQueue", NULL);
  }
  return self;
}
- (BOOL)hasAuthorization {
  return self.account != nil;
}

- (void)requestAuthorizationWithCompletionBlock:(void (^)(BOOL granted, NSError *error))block {
  dispatch_async(queue, ^{
    ACAccountStore *account = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    
    [account requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error) {
      if (granted) {
        NSArray *accounts = [account accountsWithAccountType:accountType];
        if ([accounts count]) {
          self.account = [accounts firstObject];
        }
      } else {
      }
      block(granted,error);
    }];
  });
}

- (void)fetchTimelineBefore:(NSString *)maxId completionBlock:(void (^)(NSArray *))block {
  NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithObject:@"count" forKey: @"10"];
  if (maxId) {
    [parameters setObject:maxId forKey:@"max_id"];
  }
  NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/home_timeline.json"];
  SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:url parameters:parameters];
  request.account = self.account;
  [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
    NSArray *tweets = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:&error];
    block(tweets);
  }];
}
@end
