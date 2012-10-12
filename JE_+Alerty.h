//
//  JE_+Alerty.h
//  GlobalLibrary
//
//  Created by Jesse Earle on 8/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JE_.h"

@interface JE_ (Alerty)

+ (void)okWithTitle:(NSString*)title
            message:(NSString*)message;

+ (void)authenticationWithTitle:(NSString*)title delegate:(id)delegate;
@end
