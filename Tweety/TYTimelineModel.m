//
//  TYTimelineModel.m
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYTimelineModel.h"
#import "TYTweet.h"
@interface TYTimelineModel ()
@property (strong,nonatomic) NSMutableArray *tweets;
@end

@implementation TYTimelineModel

- (NSInteger)count {
  return [self.tweets count];
}

- (TYTweet*)tweetAtIndex:(NSInteger)index {
  return [self.tweets objectAtIndex:index];
}
@end
