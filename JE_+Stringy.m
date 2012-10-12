//
//  JE_+Stringy.m
//  MentorPOS
//
//  Created by Jesse Earle on 8/20/12.
//  Copyright (c) 2012 Jesse Earle. All rights reserved.
//

#import "JE_+Stringy.h"

@implementation JE_ (Stringy)
+ (NSString*)trimAllWhitey:(NSString*)string
{
    if ([string isEqual:[NSNull null]]) {
        return @"";
    }
    return [string stringByTrimmingCharactersInSet:
                   [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (BOOL)string:(NSString*)string
containsString:(NSString*)substring
{
    string = [string lowercaseString];
    substring = [substring lowercaseString];
    
    NSRange textRange = [string rangeOfString:substring];
    if (textRange.location != NSNotFound) {
        return YES;
    }
    return NO;
}

+ (NSString*)prettyMoneyFloat:(float)num
{
    NSNumberFormatter* formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSString* prettyMoneyFloat = [formatter stringFromNumber:[NSNumber numberWithFloat:num]];
    return prettyMoneyFloat;
}
@end
