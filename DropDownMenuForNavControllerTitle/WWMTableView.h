//
//  WWMTableView.h
//  DropDownMenuForNavControllerTitle
//
//  Created by weiming wu on 3/9/16.
//  Copyright © 2016 weiming wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WWMMenuConfiguration.h"

@interface WWMTableView : UITableView<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy) WWMMenuConfiguration* configuration;
@property (nonatomic,copy) NSArray *items;
@property (nonatomic) int selectedIndex;

- (id)initWithParam:(CGRect)frame items:(NSArray *)items configuration:(WWMMenuConfiguration *)configuration selectedIndex:(int)selectedIndex;


@end
