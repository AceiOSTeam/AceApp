//
//  AppDelegate.h
//  InclinIQ
//
//  Created by Gagan on 08/09/14.
//  Copyright (c) 2014 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
}
@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) UIWindow *window;
-(void)ChangeRootViewController:(UIViewController *)viewController;
@end
