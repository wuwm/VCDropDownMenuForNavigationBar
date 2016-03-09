//
//  WWMTableView.m
//  DropDownMenuForNavControllerTitle
//
//  Created by weiming wu on 3/9/16.
//  Copyright © 2016 weiming wu. All rights reserved.
//

#import "WWMTableView.h"

@implementation WWMTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithParam:(CGRect)frame items:(NSArray *)items configuration:(WWMMenuConfiguration *)configuration selectedIndex:(int)selectedIndex
{
    self = [super initWithFrame:frame style:(UITableViewStylePlain)];
    _selectedIndex = selectedIndex;
    _items = items;
    _configuration = configuration;
    self.showsVerticalScrollIndicator = false;
    
    self.delegate = self;
    self.dataSource = self;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    [self setTableFooterView:[[UIView alloc]initWithFrame:CGRectZero]];
    self.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _items.count;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return _configuration.cellHeight;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"WWMDropDownMenuTabelCellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WWMDropDownMenuTabelCellID"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"WWMDropDownMenuTabelCellID"];
    }
    cell.textLabel.text = _items[indexPath.row];
    return cell;
}

@end
