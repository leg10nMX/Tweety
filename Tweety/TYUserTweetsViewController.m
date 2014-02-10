//
//  TYUserTweetsViewController.m
//  Tweety
//
//  Created by leg10n on 2/9/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYUserTweetsViewController.h"
#import "TYUserTweets.h"

@interface TYUserTweetsViewController ()

@end

@implementation TYUserTweetsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      self.model = [[TYUserTweets alloc] init];
    }
    return self;
}

@end
