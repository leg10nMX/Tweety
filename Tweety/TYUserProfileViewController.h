//
//  TYUserProfileViewController.h
//  Tweety
//
//  Created by leg10n on 2/8/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TYUserProfileViewController : UIViewController

- (IBAction)showTweets:(id)sender;

@property (weak, nonatomic)IBOutlet UIImageView *profileImage;
@property (weak, nonatomic)IBOutlet UILabel *name;
@property (weak, nonatomic)IBOutlet UILabel *screenName;
@property (weak, nonatomic)IBOutlet UILabel *description;
@end
