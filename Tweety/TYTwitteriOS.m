//
//  TYTwitteriOS.m
//  Tweety
//
//  Created by leg10n on 2/8/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <Accounts/Accounts.h>

#import "TYTwitteriOS.h"

@interface TYTwitteriOS ()
@property (strong, nonatomic) ACAccount* account;
@end

@implementation TYTwitteriOS
- (BOOL)hasAuthorization {
  return self.account != nil;
}

- (void)requestAuthorizationWithCompletionBlock:(void (^)(BOOL granted, NSError *error))block {
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
}
@end
