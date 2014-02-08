//
//  TYLoginViewController.m
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "TYLoginViewController.h"
#import "TYTwitter.h"

@interface TYLoginViewController ()

@end

@implementation TYLoginViewController
#pragma mark - Lifecycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions
- (IBAction)login:(id)sender {
  [self.activityIndicator startAnimating];
  
  __weak TYLoginViewController *_self = self;
  [[TYTwitter sharedInstance] requestAuthorizationWithCompletionBlock:^(BOOL granted, NSError *error) {
    [_self.activityIndicator stopAnimating];
    if (granted) {
      [_self dismissModalViewControllerAnimated:YES];
    } else {
    }
    if (error) {
      
    }
  }];
}

@end
