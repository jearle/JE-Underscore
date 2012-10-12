//
//  JE_+Alerty.m
//  GlobalLibrary
//
//  Created by Jesse Earle on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JE_+Alerty.h"

@implementation JE_ (Alerty)

+ (void)okWithTitle:(NSString*)title
            message:(NSString*)message
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:message
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK" 
                                          otherButtonTitles:nil];
    [alert show];
}

+ (void)authenticationWithTitle:(NSString*)title delegate:(id)delegate
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:title
                                                    message:@""
                                                   delegate:delegate
                                          cancelButtonTitle:@"Login"
                                          otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
    [alert show];
}
@end
