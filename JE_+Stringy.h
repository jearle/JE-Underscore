//
//  JE_+Stringy.h
//  MentorPOS
//
//  Created by Jesse Earle on 8/20/12.
//  Copyright (c) 2012 Jesse Earle. All rights reserved.
//

#import "JE_.h"

@interface JE_ (Stringy)
+ (NSString*)trimAllWhitey:(NSString*)string;
+ (BOOL)string:(NSString*)string
containsString:(NSString*)substring;

+ (NSString*)prettyMoneyFloat:(float)num;
@end
