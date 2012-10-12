//
//  JE_+NavigationBary.m
//  Mentor POS
//
//  Created by Jesse Earle on 9/24/12.
//  Copyright (c) 2012 Propeller Communications. All rights reserved.
//

#import "JE_+NavigationBary.h"

@implementation JE_ (NavigationBary)

+ (void)withNavigationBar:(UINavigationBar*)bar
  setBackgroundImageNamed:(NSString*)name
{
    [bar setBackgroundImage:[UIImage imageNamed:name] forBarMetrics:UIBarMetricsDefault];
}

+ (UIImageView*)withNavigationBar:(UINavigationBar*)bar
               addTitleImageNamed:(NSString*)imageName
{
    UIImage* image = [UIImage imageNamed:imageName];
    UIImageView* imageView = [[UIImageView alloc] initWithImage:image];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    imageView.center = bar.center;
    [bar addSubview:imageView];
    return imageView;
}
@end
