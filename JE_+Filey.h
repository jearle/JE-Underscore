//
//  JE_+Filey.h
//  GlobalLibrary
//
//  Created by Jesse Earle on 8/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JE_.h"

@interface JE_ (Filey)

#pragma mark - User Folders
+ userFolder:(NSSearchPathDirectory)directory;

+ (NSString*)docs;
+ (NSString*)temp;
+ (NSString*)lib;
+ (NSString*)bundleFile:(NSString*)path;

#pragma mark - File System
+ (NSFileManager*)manager;

+ (NSArray*)allBundleFileNames;
+ (NSArray*)bundleFileNamesContainingString:(NSString*)s;

+ (BOOL)copyFile:(NSString*)path
              to:(NSString*)newPath;
+ (BOOL)fileExists:(NSString*)path;
+ (BOOL)isDirectory:(NSString*)path;
+ (BOOL)createFolder:(NSString*)path;

@end