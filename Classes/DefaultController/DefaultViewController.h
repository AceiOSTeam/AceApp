//
//  DefaultViewController.h
//  InclinIQ
//
//  Created by Gagan on 14/09/14.
//  Copyright (c) 2014 Ace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Utils.h"
#import "Defines.h"
#import "AppDelegate.h"

@interface DefaultViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSInteger indexPathOfCell;
    NSMutableArray *arrQueue;
    NSMutableArray *arrStrings;
    
    UITableView *tblView;
    UIButton *btnLeft;
    UIButton *btnRight;
    BOOL isTableview;
    IBOutlet UIView *viewSectionHeader;
}

-(void)btnRightClicked;
@end
