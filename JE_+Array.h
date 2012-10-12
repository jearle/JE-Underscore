//
//  JE_+Array.h
//  Mentor POS
//
//  Created by Jesse Earle on 10/2/12.
//  Copyright (c) 2012 Propeller Communications. All rights reserved.
//

#import "JE_.h"

@interface JE_ (Array)
+ (NSArray*)filterArray:(NSArray*)array
      usingSearchString:(NSString*)searchString
             onProperty:(NSString*)propertyName;
@end
