//
//  LoginViewController.m
//  Filenet
//
//  Created by sravan.vodnala on 28/05/14.
//  Copyright (c) 2014 sravan.vodnala. All rights reserved.
//

#import "LoginViewController.h"
#import "Utils.h"
#import "Structures.h"
#import "AppDelegate.h"
#import "HomeViewController.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillShow:)
													 name:UIKeyboardWillShowNotification
												   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
												 selector:@selector(keyboardWillHide:)
													 name:UIKeyboardWillHideNotification
												   object:nil];
        
    }
    return self;
}
#pragma mark - Keyboard Notification Method
-(void) keyboardWillHide:(NSNotification *)note
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.3];
    
    //        if(isLandscape || isLandscapeFirst)
    //            viewTextField.frame = CGRectMake( viewTextField.frame.origin.x, 316.5, viewTextField.frame.size.width, viewTextField.frame.size.height);
    //        else
    //            viewTextField.frame = CGRectMake( viewTextField.frame.origin.x, 320, viewTextField.frame.size.width, viewTextField.frame.size.height);
    [UIView commitAnimations];
}
-(void) keyboardWillShow:(NSNotification *)note
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:.3];
    
    //        if(isLandscape || isLandscapeFirst)
    //            viewTextField.frame = CGRectMake( viewTextField.frame.origin.x, 200, viewTextField.frame.size.width, viewTextField.frame.size.height);
    //        else
    //            viewTextField.frame = CGRectMake( viewTextField.frame.origin.x, 320, viewTextField.frame.size.width, viewTextField.frame.size.height);
    [UIView commitAnimations];
}
#pragma mark - View
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    loadingProgress = [[MBProgressHUD alloc] initWithView:self.view];
    loadingProgress.labelText = @"Authenticating...";
    [self.view addSubview:loadingProgress];
    
    
    CALayer * l = [btnLogin layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:10.0];
    
    l = [viewTextField layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:10.0];
    
    l = [viewSubview layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:10.0];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    self.title = @"Login";
    
    UIButton *btnInfo = [UIButton buttonWithType:UIButtonTypeInfoLight];
    btnInfo.frame = CGRectMake(0,0,45,45);
    btnInfo.titleLabel.textColor = [UIColor whiteColor];
    btnInfo.tintColor = [UIColor whiteColor];
    [btnInfo addTarget:self action:@selector(btnAboutClicked) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *lrightBtn = [[UIBarButtonItem alloc]initWithCustomView:btnInfo];
    self.navigationItem.rightBarButtonItem = lrightBtn;
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    if(LessThanIOS7)
    {
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:195/255.0 green:145/255.0 blue:87/255.0 alpha:1.0f];
    }
    else
    {
        [self setNeedsStatusBarAppearanceUpdate];
        self.navigationController.navigationBar.barTintColor =   [UIColor colorWithRed:195/255.0 green:145/255.0 blue:87/255.0 alpha:8.0f];
        self.navigationController.navigationBar.translucent = NO;
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    }
    
    [self setShadowEffectForUIButton:btnLogin];
    [self setShadowEffectForView:viewTextField];
}
-(void)setShadowEffectForUIButton:(UIButton *)view
{
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 0.5f;
    view.layer.shadowOffset = CGSizeMake(7.0f, 7.0f);
    
    view.layer.shadowRadius = 5.0f;
    view.layer.masksToBounds = NO;
    
    UIBezierPath *pathBtn = [UIBezierPath bezierPathWithRect:view.bounds];
    view.layer.shadowPath = pathBtn.CGPath;
}
-(void)setShadowEffectForView:(UIView *)view
{
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 0.7f;
    view.layer.shadowOffset = CGSizeMake(7.0f, 7.0f);
    
    view.layer.shadowRadius = 5.0f;
    view.layer.masksToBounds = NO;
    
    UIBezierPath *pathBtn = [UIBezierPath bezierPathWithRect:view.bounds];
    view.layer.shadowPath = pathBtn.CGPath;
}

#pragma mark - textFiled Delegates
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return  YES;
}
/**
 *  This method is for hiding keyboard
 *
 *  @param textField -current textfield
 *
 *  @return - return the boolean value for hiding keyboard
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(txtFldUserName == textField)
        [txtFldPassword becomeFirstResponder];
    else
        [txtFldPassword resignFirstResponder];
    return YES;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if ([textField.text stringByAppendingString:string].length >= 20)
        return NO;
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark - btnClicked
-(void)btnAboutClicked
{
    //    AboutController *objController = [[AboutController alloc] initWithNibName:nil bundle:nil];
    //    [self.navigationController pushViewController:objController animated:YES];
    //    objController = nil;
    
    [txtFldPassword resignFirstResponder];
    [txtFldUserName resignFirstResponder];
}
- (IBAction)btnLoginClicked:(UIButton *)sender
{
    [txtFldUserName resignFirstResponder];
    [txtFldPassword resignFirstResponder];
    
    HomeViewController *projectViewController = [[HomeViewController alloc]init];
    AppDelegate *appdelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    [appdelegate ChangeRootViewController:projectViewController];
    
    /*if (txtFldUserName.text == nil || [txtFldPassword.text isEqualToString:@""] || txtFldUserName.text == nil || [txtFldPassword.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter your login credentials" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        if (txtFldUserName.text == nil || [txtFldPassword.text isEqualToString:@""] || txtFldUserName.text == nil || [txtFldPassword.text isEqualToString:@""])
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please enter your login credentials" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert show];
        }else {
            
            if( ![Utils checkNet] )
            {
                UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Alert" message:@"Device is not connected to internet" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
                [alert show];
            }
            else
            {
                
                
                [loadingProgress show:YES];
                loginRequestStruct *obj = [[loginRequestStruct alloc]init];
                obj.userName = txtFldUserName.text;
                obj.password = txtFldPassword.text;
                obj.userName = @"mary";
                obj.password = @"IBMFileNetP8";
                
                webService = [[WebServerManager alloc]init];
                [webService sendRequestToServer:login withObject:obj withRefrence:self];
            }
        }
    }*/
}
-(void)pushMainQueueController
{
    //    FilenetAppDelegate *objAppdelegate =(FilenetAppDelegate *) [[UIApplication sharedApplication] delegate];
    //    [UIView transitionWithView:self.navigationController.view.window duration:1.0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^ { [objAppdelegate  OpenDashBoard];}completion:nil];
}
#pragma mark Login Response Handling
-(void)didReciveResponse:(id)responsedata withMethodName:(wsMethodNames)name error:(int)errorCode
{
    
    NSLog(@"didReciveResponceObj form view controller");
    [self performSelectorOnMainThread:@selector(removeIndicator) withObject:nil waitUntilDone:YES];
    
    if (errorCode !=0)
    {
        NSString * code = [NSString stringWithFormat:@"%d",errorCode];
        statusMessage = [NSString stringWithFormat:@"Login authentication failed with error code : %@",code];
        [self performSelectorOnMainThread:@selector(ShowAlert) withObject:nil waitUntilDone:YES];
    }
    else
    {
        
    }
}
-(void)viewDidDisappear:(BOOL)animated
{
    //    [webService CancelRequest];
    //    webService._delegate = nil;
}

-(void)didRecivewithError:(NSError *)error
{
    [self performSelectorOnMainThread:@selector(removeIndicator) withObject:nil waitUntilDone:YES];
    statusMessage =@"Error occurred while getting response from server";
    [self performSelectorOnMainThread:@selector(ShowAlert) withObject:nil waitUntilDone:YES];
}
-(void)didRecivewithNullData
{
    [self performSelectorOnMainThread:@selector(removeIndicator) withObject:nil waitUntilDone:YES];
    statusMessage =@"Login failed";
    [self performSelectorOnMainThread:@selector(ShowAlert) withObject:nil waitUntilDone:YES];
    
}
-(void)ShowAlert
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:statusMessage delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}
-(void)removeIndicator
{
    [loadingProgress hide:YES];
}
@end
