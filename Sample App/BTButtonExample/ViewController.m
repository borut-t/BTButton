//
//  ViewController.m
//  BTButtonExample
//
//  Created by Borut Tomažin on 6/11/13.
//  Copyright (c) 2013 Borut Tomazin. All rights reserved.
//

#import "ViewController.h"
#import "BTButton.h"

@interface ViewController ()

@property (nonatomic, strong) IBOutlet BTButton *myButton;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.myButton setTitle:@"Custom Button" forState:UIControlStateNormal];
    [self.myButton setImage:[UIImage imageNamed:@"logo.png"] forState:UIControlStateNormal];
    [self.myButton setImage:[UIImage imageNamed:@"logo_hover.png"] forState:UIControlStateHighlighted];
    [self.myButton setBackgroundColor:[UIColor colorWithRed:0.f green:0.f blue:255.f alpha:0.4f]];
    [self.myButton setBackgroundColorHighlighted:[UIColor colorWithRed:0.f green:0.f blue:255.f alpha:0.5f]];
    [self.myButton setCornerRadius:6.f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
