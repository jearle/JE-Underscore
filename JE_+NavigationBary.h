//
//  JE_+NavigationBary.h
//  Mentor POS
//
//  Created by Jesse Earle on 9/24/12.
//  Copyright (c) 2012 Propeller Communications. All rights reserved.
//

#import "JE_.h"
#import "JE_+Viewy.h"

@interface JE_ (NavigationBary)
+ (void)withNavigationBar:(UINavigationBar*)bar
  setBackgroundImageNamed:(NSString*)name;

+ (UIImageView*)withNavigationBar:(UINavigationBar*)bar
               addTitleImageNamed:(NSString*)imageName;
@end
