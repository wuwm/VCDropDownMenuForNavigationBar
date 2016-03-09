//
//  WWMDropDownMenu.m
//  DropDownMenuForNavControllerTitle
//
//  Created by weiming wu on 3/9/16.
//  Copyright © 2016 weiming wu. All rights reserved.
//

#import "WWMDropDownMenu.h"

@implementation WWMDropDownMenu

-(id)init:(CGRect)frame title:(NSString *)title items:(NSArray *)items containerView:(UIView *)containerView selectedIndex:(int)selectedIndex
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _configuration = [[WWMMenuConfiguration alloc]init];
        _tableContainerView = containerView;
        _mainScreenBounds = [UIScreen mainScreen].bounds;
        _isShown = false;
        _items = items;
        
        //Init button
        _menuButton = [[UIButton alloc]initWithFrame:frame];
        [_menuButton addTarget:self action:@selector(onMenuButtonClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_menuButton];
        
        _menuTitle = [[UILabel alloc]initWithFrame:frame];
        _menuTitle.text = title;
        _menuTitle.textColor = [UIColor whiteColor];
        _menuTitle.textAlignment = NSTextAlignmentCenter;
        [_menuButton addSubview:_menuTitle];
        _menuArrow = [[UIImageView alloc]initWithImage:_configuration.arrowImage];
        [_menuButton addSubview:_menuArrow];
        
        //Init tableview
        CGRect tableViewFrame = CGRectMake(_mainScreenBounds.size.width/ 7 * 2, _mainScreenBounds.origin.y, _mainScreenBounds.size.width / 7 * 3, _mainScreenBounds.size.height*3/7 );
        _tableView = [[WWMTableView alloc]initWithParam:tableViewFrame items:items configuration:_configuration selectedIndex:0];
        
        
    }
    return self;
}

-(void)layoutSubviews
{
    [_menuTitle sizeToFit];
    _menuTitle.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
    _menuArrow.frame = CGRectMake(0, 0, 12, 7);
    _menuArrow.center = CGPointMake(CGRectGetMaxX(self.menuTitle.frame) + 15, self.frame.size.height/2);
}

-(void)showMenu
{
    UIView* headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 65)];
    [_tableView setTableHeaderView:headView];
    [_tableView reloadData];
    
    [self.tableContainerView addSubview:_tableView];
    
    [self rotateArrow];
    
    //Animation for tableview
    CGRect tempFrame = _tableView.frame;
    tempFrame.origin.y = -self.items.count * self.configuration.cellHeight;
    _tableView.frame = tempFrame;
    
    [UIView animateWithDuration:0.5 animations:^{
        CGRect tempFrame = _tableView.frame;
        tempFrame.origin.y = 0;
        _tableView.frame = tempFrame;
        _tableView.contentOffset = CGPointMake(0, -10);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            _tableView.contentOffset = CGPointZero;
        }];
    }];
    
}

-(void)hideMenu
{
    // Rotate arrow
    [self rotateArrow];
    
    // Animation
    [UIView animateWithDuration:0.5 delay:0.15 options:UIViewAnimationOptionTransitionNone animations:^{
        _tableView.contentOffset = CGPointMake(0, 10);
        CGRect tempFrame = _tableView.frame;
        tempFrame.origin.y = -self.items.count * self.configuration.cellHeight - 300;
        _tableView.frame = tempFrame;
        
    } completion:^(BOOL finished) {
        [_tableView removeFromSuperview];
    }];
}

-(void)rotateArrow
{
    [UIView animateWithDuration:0.5 animations:^{
        _menuArrow.transform = CGAffineTransformRotate(_menuArrow.transform, 180 * M_PI/180);
    }];
}

-(void)onMenuButtonClick:(UIButton *)sender
{
    _isShown = !_isShown;
    if(_isShown){
        [self showMenu];
    }else{
        [self hideMenu];
    }
}
@end
