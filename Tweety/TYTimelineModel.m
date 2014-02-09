//
//  TYTimelineModel.m
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYTimelineModel.h"
#import "TYTwitter.h"

@implementation TYTimelineModel

- (void)fetchFromSourceBeforeId:(NSString*)maxId {
  [[TYTwitter sharedInstance] fetchTimelineBefore:maxId completionBlock:^(NSArray *tweetArray) {
    [self updateTweets:tweetArray];
  }];
}
@end
