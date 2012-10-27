//
//  HKAppDelegate.h
//  BookBird
//
//  Created by Rob Stearn on 27/10/2012.
//  Copyright (c) 2012 HackingWithRobAndSally. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HKAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navController;

@end
