//
//  BAAlertView.m
//  blueApe
//
//  Created by leg10n on 1/2/14.
//  Copyright (c) 2014 Macrominds. All rights reserved.
//

#import "BAAlertView.h"

@interface BAAlertView ()
@property (nonatomic,strong) BAAlertViewBlock cancelBlock;
@property (nonatomic,strong) NSArray* otherButtonBlocks;
@end

@implementation BAAlertView
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        if (nil != self.cancelBlock)
            self.cancelBlock(alertView);
        return;
    }
    BAAlertViewBlock block = [self.otherButtonBlocks objectAtIndex:buttonIndex - 1];
    if (nil != block)
        block(alertView);
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message  cancelButtonTitle:(NSString *)cancelButtonTitle cancelBlock:(BAAlertViewBlock)cancelBlock otherButtonTitles:(NSArray *)titles otherButtonBlocks:(NSArray*)blocks
{
    if (self = [super initWithTitle:title message:message delegate:self cancelButtonTitle:cancelButtonTitle otherButtonTitles:nil])
    {
        self.cancelBlock = cancelBlock;
        self.otherButtonBlocks = blocks;
        [titles enumerateObjectsUsingBlock:^(NSString* title, NSUInteger idx, BOOL *stop) {
            [self addButtonWithTitle:title];
        }];
    }
    
    return self;
}
-(void)setCancelBlock:(BAAlertViewBlock)cancelBlock otherButtonBlocks:(NSArray*)blocks
{
    self.otherButtonBlocks = blocks;
}
@end
