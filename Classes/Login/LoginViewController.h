//
//  LoginViewController.h
//  Filenet
//
//  Created by sravan.vodnala on 28/05/14.
//  Copyright (c) 2014 sravan.vodnala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Defines.h"
#import "MBProgressHUD.h"
@interface LoginViewController : UIViewController
{
     MBProgressHUD *loadingProgress;
    IBOutlet UITextField *txtFldPassword;
    IBOutlet UITextField *txtFldUserName;
    IBOutlet UIView *viewTextField;
    IBOutlet UIButton *btnLogin;
    IBOutlet UIView *viewSubview;
    NSString *statusMessage;
    IBOutlet UIImageView *imgView;
}
- (IBAction)btnLoginClicked:(UIButton *)sender;
@end
