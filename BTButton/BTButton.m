//
//  BTButton.m
//
//  Version 1.0.0
//
//  Created by Borut Tomazin on 6/11/2013.
//  Copyright 2013 Borut Tomazin
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/borut-t/BTButton
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import "BTButton.h"

#ifdef __IPHONE_6_0 // iOS6 and later
#  define UITextAlignmentCenter    NSTextAlignmentCenter
#  define UITextAlignmentLeft      NSTextAlignmentLeft
#  define UITextAlignmentRight     NSTextAlignmentRight
#  define UILineBreakModeTailTruncation     NSLineBreakByTruncatingTail
#  define UILineBreakModeMiddleTruncation   NSLineBreakByTruncatingMiddle
#endif

#define kButtonOffset 35.f
#define kTopPadding 10.f

@interface BTButton()

@property (nonatomic, strong) UIImage *normalButtonImage;
@property (nonatomic, strong) UIImage *highlightedButtonImage;

@end

@implementation BTButton


+ (BTButton *)buttonWithType:(UIButtonType)type
{
    return [super buttonWithType:UIButtonTypeCustom];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
	[self setNeedsDisplay];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.cornerRadius = 10.f;
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:0.4f];
        self.backgroundColorHighlighted = [UIColor colorWithWhite:0.f alpha:0.6f];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (self.normalButtonImage == nil || self.highlightedButtonImage == nil) {
        self.normalButtonImage = [self imageForState:UIControlStateNormal];
        self.highlightedButtonImage = [self imageForState:UIControlStateHighlighted];
        [self.imageView removeFromSuperview];
    }
    
    UIImage *buttonImage;
    if (self.state == UIControlStateNormal) {
        buttonImage = self.normalButtonImage;
        CGContextSetFillColorWithColor(context, self.backgroundColor.CGColor);
    }
    else {
        CGContextSetFillColorWithColor(context, self.backgroundColorHighlighted.CGColor);
        if (self.normalButtonImage != self.highlightedButtonImage) {
            buttonImage = self.highlightedButtonImage;
        }
    }
    
    // Draw button content view
    CGRect buttonRect = CGRectMake(0.f, 0.f, rect.size.width, rect.size.height);
    UIBezierPath *buttonBezier = [UIBezierPath bezierPathWithRoundedRect:buttonRect cornerRadius:self.cornerRadius];
    [buttonBezier addClip];
    CGContextFillRect(context, buttonRect);
    
    // Draw button image
    if (buttonImage != nil) {
        CGImageRef buttonCGImage = buttonImage.CGImage;
        CGSize imageSize = CGSizeMake(CGImageGetWidth(buttonCGImage)/[self scale], CGImageGetHeight(buttonCGImage)/[self scale]);
        CGFloat buttonYOffset = (rect.size.height-kButtonOffset)/2.f - imageSize.height/2.f + kTopPadding;
        if (self.titleLabel.text.length == 0) {
            buttonYOffset = rect.size.height/2.f - imageSize.height/2.f;
        }
        [buttonImage drawInRect:CGRectMake(rect.size.width/2. - imageSize.width/2.f,
                                           buttonYOffset,
                                           imageSize.width,
                                           imageSize.height)];
    }
    
    // Draw button title
    if (self.titleLabel.text.length > 0) {
        CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
        [self.titleLabel.text drawInRect:CGRectMake(0.f, (buttonImage != nil ? rect.size.height-kButtonOffset : rect.size.height/2 - 10.f), rect.size.width, 20.f)
                                withFont:self.titleLabel.font
                           lineBreakMode:self.titleLabel.lineBreakMode
                               alignment:UITextAlignmentCenter];
    }
    
    [self.titleLabel removeFromSuperview];
}

- (void)setBackgroundColor:(UIColor *)color
{
    _backgroundColor = color;
}

- (CGFloat)scale
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
        return [[UIScreen mainScreen] scale];
    }
    return 1.0f;
}

@end
