//
//  AppDelegate.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    for (NSInteger i = 1; i < 9; i++) {
//        NSLog(@"%i", i);
//    }
    //FooA:NSObject
    //    - (void) print {
    //        NSLog(@"A");
    //    }
    //
    //    + (void) print {
    //        NSLog(@"A+");
    //    }
    //
    //FooB:FooA
    //
    //    - (void) print {
    //        NSLog(@"B");
    //    }
    //
    //
    //    FooB objB = [[FooB alloc] init];
    //    FooA objA = (FooB*) objB;
    //
    //    [objA print];
    //    [FooB print];
    // __weak
    //    dispatch_queue_t queue = dispatch_queue_create("com.developer.queue", DISPATCH_QUEUE_SERIAL);
    //    dispatch_async(queue, ^{
    //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title" message:@"message" delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
    //        [alert show];
    //    });
    
    //    __weak typeof(self) weakSelf = self;
    //    self.block = ^() {
    //        __strong typeof(self) strongSelf = weakSelf;
    //        BOOL a = YES;
    //        BOOL b = YES;
    //        
    //        NSAssert(a == b, @"assert");
    //    };
    
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"Hello world");
//    });
    
    
    return YES;
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
