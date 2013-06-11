//
//  BTButton.h
//  PlanetTV
//
//  Created by Borut Tomažin on 6/5/13.
//  Copyright (c) 2013 TSmedia, medijske vsebine in storitve, d.o.o. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BTButton : UIButton

@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, strong) UIColor *backgroundColorHighlighted;

@end
