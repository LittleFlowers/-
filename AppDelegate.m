//
//  AppDelegate.m
//  吃玩乐
//
//  Created by 小菊花 on 16/3/2.
//  Copyright © 2016年 小菊花. All rights reserved.
//

#import "AppDelegate.h"
#import "CWL_BaseViewController.h"
#import "CWL_MeController.h"
#import "CWL_EatController.h"
#import "CWL_HappyController.h"
#import "CWL_MainController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self initControllers];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}
-(void)initControllers{
    NSArray *controllerNameList = @[@"CWL_MainController",@"CWL_EatController",@"CWL_HappyController",@"CWL_MeController"];
    
    UITabBarController *rootController = [[UITabBarController alloc]init];
    NSMutableArray *rootControllerClass = [NSMutableArray array];
    for (NSString *controllerName in controllerNameList) {
        
        UINavigationController *controller = [[UINavigationController alloc]initWithRootViewController:[[NSClassFromString(controllerName) alloc]init] ];
        [rootControllerClass addObject:controller];
    }
    rootController.viewControllers = rootControllerClass;
    NSArray *titleList = @[@"首页",@"吃",@"玩",@"我的"];
    for (int i = 0; i<rootControllerClass.count; i++) {
        UIBarItem *item = rootController.tabBar.items[i];
        item.title = titleList[i];
        item.image = [UIImage imageNamed:titleList[i]];
    }
    self.window.rootViewController = rootController;
   
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

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
