//
//  Defines.h
//  InclinIQ
//
//  Created by Gagan on 08/09/14.
//  Copyright (c) 2014 Ace. All rights reserved.
//

#ifndef InclinIQ_Defines_h
#define InclinIQ_Defines_h

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "MBProgressHUD.h"

typedef enum webService_method_names
{
    login
}wsMethodNames;


#pragma mark - SQL table names


#define BASE_URL              @"http://communitydev.crresearch.com/api_crr/MobileHandler.ashx"
#define LessThanIOS7 ([[[UIDevice currentDevice] systemVersion] compare:(@"7.0") options:NSNumericSearch] == NSOrderedAscending)

#define SCREEN_WIDTH ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)
#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define screenWidth [[UIScreen mainScreen] bounds].size.width
#define screenHeight [[UIScreen mainScreen] bounds].size.height

#endif
