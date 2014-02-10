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

- (BOOL)postTweet:(NSString *)text inResponseTo:(NSString *)tweetId error:(NSError *)error completionBlock:(void (^)(NSDictionary *))block{
  if ([text length] < 140) {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithObject:text forKey:@"status"];
    if (tweetId) {
      [parameters setObject:tweetId forKey:@"in_reply_to_status_id"];
    }
    
    [self authenticatedRequestWithUrl:[NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/update.json"]
                               method:SLRequestMethodPOST
                            parameter:parameters
                      completionBlock:block];
    return YES;
  }
  return NO;
}

- (void)fetchUserProfileWithCompletionBlock:(void (^)(NSDictionary *))block {
  NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/account/verify_credentials.json"];
  [self authenticatedRequestWithUrl:url method:SLRequestMethodGET parameter:nil completionBlock:block];
}

- (void)fetchTweetsFromURL:(NSString*)urlAsString beforeTweetId:(NSString *)maxId completionBlock:(void (^)(NSArray *))block {
}

- (void)fetchTweetsForUserId:(NSString *)userId beforeTweetId:(NSString *)maxId completionBlock:(void (^)(NSArray *))block {
  NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"10", @"count", userId, @"user_id", nil];
  if (maxId) {
    [parameters setObject:maxId forKey:@"max_id"];
  }
  
  NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/user_timeline.json"];
  [self authenticatedRequestWithUrl:url method:SLRequestMethodGET parameter:parameters completionBlock:block];
}

- (void) fetchTimelineBefore:(NSString *)maxId completionBlock:(void (^)(NSArray *))block {
  NSMutableDictionary *parameters = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"10", @"count",nil];
  if (maxId) {
    [parameters setObject:maxId forKey:@"max_id"];
  }
  
  NSURL *url = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/home_timeline.json"];
  [self authenticatedRequestWithUrl:url method:SLRequestMethodGET parameter:parameters completionBlock:block];
}

- (void)authenticatedRequestWithUrl:(NSURL*)url method:(SLRequestMethod)method parameter:(NSDictionary*)parameters completionBlock:(void (^)(id))block {
  SLRequest *request = [SLRequest requestForServiceType:SLServiceTypeTwitter
                                          requestMethod:method
                                                    URL:url
                                             parameters:parameters];
  request.account = self.account;
  [request performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error) {
    if (responseData) {
      NSArray *tweets = [NSJSONSerialization JSONObjectWithData:responseData
                                                        options:NSJSONReadingMutableLeaves
                                                          error:&error];
      block(tweets);
    }
  }];
}

- (NSString*)userId {
  return [self.account valueForKeyPath:@"properties.user_id"];
}
@end
