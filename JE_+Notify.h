//
//  JE_+Notify.h
//  GlobalLibrary
//
//  Created by Jesse Earle on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JE_.h"

@interface JE_ (Notify)
+ (NSNotificationCenter*)notifyCenter;

+ (void)notifyName:(NSString*)name 
            object:(id) object;

+ (void)notifyObserver:(id)observer 
              selector:(SEL)selector 
                  name:(NSString*)name;
@end
