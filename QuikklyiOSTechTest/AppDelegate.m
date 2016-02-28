//
//  AppDelegate.m
//  QuikklyiOSTechTest
//
//  Created by Gregg Fisher on 21/02/2016.
//  Copyright © 2016 Quikkly. All rights reserved.
//

#import "AppDelegate.h"
#import "WordDictionary.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    WordDictionary* wordDictionary = [[WordDictionary alloc] init];
    _anagramGame = [[AnagramGame alloc] initWithDictionary:wordDictionary
                                                 andString:@"areallylongword"];
    
    return YES;
}

@end
