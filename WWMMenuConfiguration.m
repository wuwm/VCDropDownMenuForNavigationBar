//
//  NSObject+WWMMenuConfiguration.m
//  DropDownMenuForNavControllerTitle
//
//  Created by weiming wu on 3/9/16.
//  Copyright © 2016 weiming wu. All rights reserved.
//

#import "WWMMenuConfiguration.h"

@implementation WWMMenuConfiguration

-(void)setDefaultValue
{
    _arrowImage = [UIImage imageNamed:@"arrow_down_icon"];
    CGFloat height = 50;
    _cellHeight = height;
    _cellBackgroundColor = [UIColor whiteColor];
    _cellSelectionColor = [UIColor grayColor];
    _cellTextLabelColor = [UIColor darkGrayColor];
    _cellTextLabelFont = [UIFont fontWithName:@"HelveticaNeue-Bold" size:(CGFloat)17];
    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setDefaultValue];
    }
    return self;
}

@end
