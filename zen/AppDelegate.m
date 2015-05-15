//
//  AppDelegate.m
//  zen
//
//  Created by XingGao on 5/10/15.
//  Copyright (c) 2015 ShiLin. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate (){
    CGRect screenSize;
}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UIStoryboard *storyboard;
    UIViewController *mainViewController;
    
    screenSize = [[UIScreen mainScreen] bounds];
    if (screenSize.size.width < 768){
        NSLog(@"iPhone");
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        mainViewController = [storyboard instantiateInitialViewController];
    }
    else if (screenSize.size.width == 768){
        NSLog(@"iPad");
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
        mainViewController = [storyboard instantiateInitialViewController];
    }
    self.window.rootViewController = mainViewController;
    
    // Local Notification Setting
    
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    return YES;
}
-(void) application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@"hahahah");
    application.applicationIconBadgeNumber = 0;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"popup" object:nil];

}
- (void)applicationDidBecomeActive:(UIApplication *)application {
    application.applicationIconBadgeNumber = 0;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
