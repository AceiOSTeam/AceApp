//
//  DefaultViewController.m
//  InclinIQ
//
//  Created by Gagan on 14/09/14.
//  Copyright (c) 2014 Ace. All rights reserved.
//

#import "DefaultViewController.h"
#import "CustomCell.h"

@interface DefaultViewController ()

@end
@implementation DefaultViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = [Utils getLocalizedString:@"mymessages_title"];
    self.navigationController.navigationBarHidden = NO;
    
   UIImage *img1;
   btnLeft = [UIButton buttonWithType:UIButtonTypeCustom];
   
   img1 = [UIImage imageNamed:@"menu_whote.png"];
   btnLeft.frame = CGRectMake(0,0,48,40);
   [btnLeft setImage:img1 forState:UIControlStateNormal];
   [btnLeft addTarget:self action:@selector(btnHomeClicked) forControlEvents:UIControlEventTouchUpInside];
   
   UIBarButtonItem *lefttBtn = [[UIBarButtonItem alloc]initWithCustomView:btnLeft];
   self.navigationItem.leftBarButtonItem = lefttBtn;
   
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
   
   btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
   [btnRight setImage:[UIImage imageNamed:@"addUser_White.png"] forState:UIControlStateNormal];
   [btnRight addTarget:self action:@selector(btnRightClicked) forControlEvents:UIControlEventTouchUpInside];
   btnRight.frame = CGRectMake(0,0,44,44);
   
   UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc]initWithCustomView:btnRight];
   self.navigationItem.rightBarButtonItem = rightBtn;

    arrStrings = [[NSMutableArray alloc] initWithObjects:@"Customers",@"Plan",@"e-Detailers",@"Update",@"Settings", nil];
    arrQueue = [[NSMutableArray alloc]initWithObjects:@"customers.png",@"plan.png",@"edetailers.png",@"update.png",@"settings.png", nil];
    
    tblView = [[UITableView alloc] initWithFrame:CGRectMake(-320, 0, 320, SCREEN_HEIGHT) style:UITableViewStylePlain];
    tblView.separatorColor=[UIColor clearColor];
    tblView.separatorStyle=UITableViewCellSeparatorStyleNone;
    tblView.clipsToBounds = YES;
    tblView.delegate = self;
    tblView.dataSource = self;
    tblView.backgroundView = nil;
    tblView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0f];
    [self.view addSubview:tblView];
    
    tblView.frame = CGRectMake(-tblView.frame.size.width, 0, tblView.frame.size.width, tblView.frame.size.height);
    isTableview = NO;
}
-(void)btnHomeClicked
{
    if(isTableview)
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:.3];
        tblView.frame = CGRectMake(-tblView.frame.size.width, 0, tblView.frame.size.width, tblView.frame.size.height);
        isTableview = NO;
        [UIView commitAnimations];
    }
    else
    {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:.3];
        tblView.frame = CGRectMake(0, 0, tblView.frame.size.width, tblView.frame.size.height);
        isTableview = YES;
        [UIView commitAnimations];
    }
}
-(void)btnRightClicked
{

}
#pragma mark TableView Delegate Methods
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    view.backgroundColor =  [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1.0f];
    [view addSubview:viewSectionHeader];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 200.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrQueue count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:nil];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    cell.imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[arrQueue objectAtIndex:indexPath.row]]];
    cell.lblMain.text = [NSString stringWithFormat:@"%@",[arrStrings objectAtIndex:indexPath.row]];
    return  cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
//    AppDelegate * appDel = (AppDelegate *)[[UIApplication sharedApplication]delegate];
}
@end