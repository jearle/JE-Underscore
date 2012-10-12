//
//  JE_+Array.m
//  Mentor POS
//
//  Created by Jesse Earle on 10/2/12.
//  Copyright (c) 2012 Propeller Communications. All rights reserved.
//

#import "JE_+Array.h"

@implementation JE_ (Array)
+ (NSArray*)filterArray:(NSArray*)array
      usingSearchString:(NSString*)searchString
             onProperty:(NSString*)propertyName
{
    NSPredicate *predBlock = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        id evaluatedObjectPropertyObject = [evaluatedObject valueForKey:propertyName];
        if ([evaluatedObjectPropertyObject isKindOfClass:[NSString class]]) {
            NSString* string = evaluatedObjectPropertyObject;
            BOOL containsString = [JE_ string:string containsString:searchString];
            return containsString;
        }
        return NO;
    }];
    NSArray* filteredArray = [array filteredArrayUsingPredicate:predBlock];
    return filteredArray;
}
@end
