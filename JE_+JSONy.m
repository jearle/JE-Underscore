//
//  JE_+JSONy.m
//  GlobalLibrary
//
//  Created by Earle, Jesse (PPY-ICC) on 8/15/12.
//
//

#import "JE_+JSONy.h"

@implementation JE_ (JSONy)
+ (NSMutableDictionary*)stringToDictionary:(NSString*)jsonString
{
    NSError* error = nil;
    NSData* data = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSMutableDictionary* dictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:NSJSONReadingMutableContainers
                                                                        error:&error];
    return dictionary;
}

+ (BOOL)saveDictionary:(NSMutableDictionary*)dictionary
                  path:(NSString*)path
{
    if (![NSJSONSerialization isValidJSONObject:dictionary]) {
        NSLog(@"Invalid JSON in %s", __FUNCTION__);
        return NO;
    }
    
    NSString* folderPath = [path stringByDeletingLastPathComponent];
    if (![JE_ fileExists:folderPath]) {
        if ([JE_ createFolder:folderPath]) {
            NSLog(@"There was an error when we tried to create the folder path.");
            return NO;
        }
    }
    
    NSOutputStream* stream = [NSOutputStream outputStreamToFileAtPath:path
                                                               append:NO];
    [stream open];
    NSError* error = nil;
    [NSJSONSerialization writeJSONObject:dictionary
                                toStream:stream
                                 options:NSJSONWritingPrettyPrinted
                                   error:&error];
    [stream close];
    if (error) {
        NSLog(@"Saving JSON failed: %@", [error localizedDescription]);
        return NO;
    }
    return YES;

}

+ (BOOL)saveDictionary:(NSMutableDictionary*)dictionary
                  path:(NSString*)path
             overwrite:(BOOL)overwrite
{
    if (!overwrite) {
        [JE_ fileExists:path];
        NSLog(@"File exists at path: %@, set the overwrite parameter to YES if you would like to overwrite.", path);
        return NO;
    }
    return [JE_ saveDictionary:dictionary
                          path:path];
}

+ (NSString*)dictionaryToQueryString:(NSDictionary*)dict
{
    NSArray* arr = [JE_ queryStringComponentsFromKey:nil value:dict];
    return [JE_ makeUrlSafe:[arr componentsJoinedByString:@"&"]];
}

+ (NSArray*)queryStringComponentsFromKey:(NSString *)key value:(id)value {
    NSMutableArray *queryStringComponents = [NSMutableArray arrayWithCapacity:2];
    if ([value isKindOfClass:[NSDictionary class]]) {
        [queryStringComponents addObjectsFromArray:[self queryStringComponentsFromKey:key dictionaryValue:value]];
    } else if ([value isKindOfClass:[NSArray class]]) {
        [queryStringComponents addObjectsFromArray:[self queryStringComponentsFromKey:key arrayValue:value]];
    } else {
        static NSString * const kLegalURLEscapedCharacters = @"?!@#$^&%*+=,:;'\"`<>()[]{}/\\|~ ";
        NSString *valueString = [value description];
        NSString *unescapedString = [valueString stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        if (unescapedString) {
            valueString = unescapedString;
        }
        NSString *escapedValue = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge_retained CFStringRef)valueString, NULL, (__bridge_retained CFStringRef) kLegalURLEscapedCharacters, CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
        
        NSString *component = [NSString stringWithFormat:@"%@=%@", key, escapedValue];
        [queryStringComponents addObject:component];
    }
    
    return queryStringComponents;
}

+ (NSArray*)queryStringComponentsFromKey:(NSString *)key dictionaryValue:(NSDictionary *)dict{
    NSMutableArray *queryStringComponents = [NSMutableArray arrayWithCapacity:2];
    [dict enumerateKeysAndObjectsUsingBlock:^(id nestedKey, id nestedValue, BOOL *stop) {
        NSArray *components = nil;
        if (key == nil) {
            components = [self queryStringComponentsFromKey:nestedKey value:nestedValue];
        } else {
            components = [self queryStringComponentsFromKey:[NSString stringWithFormat:@"%@[%@]", key, nestedKey] value:nestedValue];
        }
        
        [queryStringComponents addObjectsFromArray:components];
    }];
    
    return queryStringComponents;
}

+ (NSArray* )queryStringComponentsFromKey:(NSString *)key arrayValue:(NSArray *)array{
    NSMutableArray *queryStringComponents = [NSMutableArray arrayWithCapacity:2];
    [array enumerateObjectsUsingBlock:^(id nestedValue, NSUInteger index, BOOL *stop) {
        [queryStringComponents addObjectsFromArray:[self queryStringComponentsFromKey:[NSString stringWithFormat:@"%@[]", key] value:nestedValue]];
    }];
    
    return queryStringComponents;
}
@end
