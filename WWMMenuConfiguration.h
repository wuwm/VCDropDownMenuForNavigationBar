//
//  NSObject+WWMMenuConfiguration.h
//  DropDownMenuForNavControllerTitle
//
//  Created by weiming wu on 3/9/16.
//  Copyright © 2016 weiming wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WWMMenuConfiguration : NSObject 

@property (nonatomic,assign) CGFloat cellHeight;
@property (nonatomic,copy) UIColor *cellBackgroundColor;
@property (nonatomic,copy) UIColor *cellTextLabelColor;
@property (nonatomic,copy) UIFont *cellTextLabelFont;
@property (nonatomic,copy) UIColor *cellSelectionColor;
@property (nonatomic,copy) UIImage *arrowImage;

-(void) setDefaultValue;

@end
