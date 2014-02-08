//
//  TYLoginViewController.h
//  Tweety
//
//  Created by leg10n on 2/7/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Uses the Web OAuth flow to log a user in.
 */
@interface TYLoginViewController : UIViewController

- (IBAction)login:(id)sender;

@property (weak,nonatomic) IBOutlet UITextField *username;
@property (weak,nonatomic) IBOutlet UITextField *password;
@property (weak,nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end
