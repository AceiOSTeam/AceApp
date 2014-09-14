//
//  ScheduleController.m
//  InclinIQ
//
//  Created by Gagan on 14/09/14.
//  Copyright (c) 2014 Ace. All rights reserved.
//

#import "ScheduleController.h"
#import "Defines.h"
@interface ScheduleController ()

@end

@implementation ScheduleController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Schedule Call";
    if(LessThanIOS7)
    {
        self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:73/255.0 blue:155/255.0 alpha:.8f];
    }
    else
    {
        [self setNeedsStatusBarAppearanceUpdate];
        self.navigationController.navigationBar.barTintColor =  [UIColor colorWithRed:0 green:73/255.0 blue:155/255.0 alpha:.8f];
        self.navigationController.navigationBar.translucent = NO;
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    }
    UIImage *img;
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    img = [UIImage imageNamed:@"back_btn.png"];
    btn.frame = CGRectMake(0,0,20,25);
    
    [btn setImage:img forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnMenuClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *lefttBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = lefttBtn;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSideClicked:(UIButton *)sender {
}
@end
