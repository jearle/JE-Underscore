//
//  JE_+JSONy.h
//  GlobalLibrary
//
//  Created by Earle, Jesse (PPY-ICC) on 8/15/12.
//
//

#import "JE_.h"
#import "JE_+Filey.h"
#import "JE_+Downloady.h"

@interface JE_ (JSONy)

+ (NSMutableDictionary*)stringToDictionary:(NSString*)string;


+ (BOOL)saveDictionary:(NSMutableDictionary*)dictionary
                  path:(NSString*)path;

+ (BOOL)saveDictionary:(NSMutableDictionary*)dictionary
                  path:(NSString*)path
             overwrite:(BOOL)overwrite;

+ (NSString*)dictionaryToQueryString:(NSDictionary*)dict;
@end
