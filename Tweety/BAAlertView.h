//
//  BAAlertView.h
//  blueApe
//
//  Created by leg10n on 1/2/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BAAlertViewBlock)(UIAlertView* alertView);
@interface BAAlertView : UIAlertView <UIAlertViewDelegate>

/**
 *  Convinience method to initialize the Alert view with a delegate block
 *
 *  @param title             <#title description#>
 *  @param message           <#message description#>
 *  @param cancelButtonTitle <#cancelButtonTitle description#>
 *  @param cancelBlock       <#cancelBlock description#>
 *  @param titles            <#titles description#>
 *  @param blocks            <#blocks description#>
 *
 *  @return An Initialized instance
 */
- (id)initWithTitle:(NSString *)title message:(NSString *)message  cancelButtonTitle:(NSString *)cancelButtonTitle cancelBlock:(BAAlertViewBlock)cancelBlock otherButtonTitles:(NSArray *)titles otherButtonBlocks:(NSArray*)blocks;

/**
 *  Sets the delegate blocks for the buttons, every block takes a BAAlertView * parameter to indicate the alertview triggering the callback.
 *
 *  @param cancelBlock cancel delegate block
 *  @param blocks      receives an NSArray of delegate Blocks for every other button added
 */
-(void)setCancelBlock:(BAAlertViewBlock)cancelBlock otherButtonBlocks:(NSArray*)blocks;
@end
