//
//  AppDelegate.h
//  GoogleLogin
//
//  Created by 김민아 on 2017. 2. 3..
//  Copyright © 2017년 김민아. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;

@end

