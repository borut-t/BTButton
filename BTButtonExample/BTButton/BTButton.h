//
//  BTButton.h
//  BTButton
//
//  Created by Borut Tomažin on 6/11/13.
//  Copyright (c) 2013 Borut Tomazin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTButton : UIButton

@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *backgroundColorHighlighted;

@end
