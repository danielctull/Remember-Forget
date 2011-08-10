//
//  DCTAppDelegate.m
//  DCTRemember
//
//  Created by Daniel Tull on 10.08.2011.
//  Copyright (c) 2011 Daniel Tull. All rights reserved.
//

#import "DCTAppDelegate.h"
#import "NSObject+DCTRemember.h"

@implementation DCTAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	NSString *string = [[[[[@"" remember] remember] remember] remember] remember];
	
	while ([string rememberCount] > 0) {
		NSLog(@"%@:%@ %i", self, NSStringFromSelector(_cmd), [string rememberCount]);
		[string forget];
	}
	
	NSDate *date = [NSDate dateWithTimeIntervalSince1970:-11491632000];
	[[date remember] remember];
	
	// Though we should always remember this date, we do actually forget it:
	[date forget];
	[date forget];
	
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
	/*
	 Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	 Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	 */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	/*
	 Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	 If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	 */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	/*
	 Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	 */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	/*
	 Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	 */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	/*
	 Called when the application is about to terminate.
	 Save data if appropriate.
	 See also applicationDidEnterBackground:.
	 */
}

@end
