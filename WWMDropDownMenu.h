//
//  WWMDropDownMenu.h
//  DropDownMenuForNavControllerTitle
//
//  Created by weiming wu on 3/9/16.
//  Copyright © 2016 weiming wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WWMMenuConfiguration.h"
#import "WWMTableView.h"

@interface WWMDropDownMenu : UIView

@property (nonatomic,copy) WWMMenuConfiguration* configuration;
@property (nonatomic) UIButton* menuButton;
@property (nonatomic) UILabel* menuTitle;
@property (nonatomic,copy) UIImageView* menuArrow;
@property (nonatomic) WWMTableView* tableView;
@property (nonatomic,copy) NSArray* items;
@property (nonatomic) UIView* tableContainerView;
@property (nonatomic) CGRect mainScreenBounds;
@property (nonatomic) BOOL isShown;


-(void)showMenu;
-(void)hideMenu;
-(void)rotateArrow;
-(void)onMenuButtonClick:(UIButton *)sender;
-(id)init:(CGRect)frame title:(NSString*)title items:(NSArray*)items containerView:(UIView*)containerView selectedIndex:(int)selectedIndex;

@end
