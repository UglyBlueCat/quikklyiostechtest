//
//  AppDelegate.h
//  QuikklyiOSTechTest
//
//  Created by Gregg Fisher on 21/02/2016.
//  Copyright © 2016 Quikkly. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnagramGame.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property AnagramGame* anagramGame;

@end

