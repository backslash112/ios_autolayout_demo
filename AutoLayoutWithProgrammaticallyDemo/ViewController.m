//
//  ViewController.m
//  AutoLayoutWithProgrammaticallyDemo
//
//  Created by YangCun on 15/1/7.
//  Copyright (c) 2015年 backslash112. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *yellowView;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
    // [self example_1];
    // [self example_2];
    // [self example_3];
    // [self example_4];
    // [self example_5];
    [self example_6];
}

- (void)setupViews {
    self.redView = [UIView new];
    self.redView.translatesAutoresizingMaskIntoConstraints = NO;
    self.redView.backgroundColor = [UIColor colorWithRed:0.95 green:0.47 blue:0.48 alpha:1.0];
    [self.view addSubview:self.redView];
    
    self.yellowView = [UIView new];
    self.yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    self.yellowView.backgroundColor = [UIColor colorWithRed:1.00 green:0.83 blue:0.58 alpha:1.0];
    [self.view addSubview:self.yellowView];
}

// Set the redView's frame.
- (void)example_1 {
    NSDictionary *viewsDictionary = @{@"redView": self.redView};
    
    // part 1: Define the redView's height and width.
    NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView(100)]"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:viewsDictionary];
    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[redView(100)]"
                                                                    options:0
                                                                    metrics:nil
                                                                      views:viewsDictionary];
    [self.redView addConstraints:constraint_V];
    [self.redView addConstraints:constraint_H];
    
    // part 2: Define the redView's position.
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[redView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H];
}

- (void)example_2 {
    
    // Define the yellowView's height and width.
    NSDictionary *viewsDictionary = @{@"redView": self.redView,
                                      @"yellowView": self.yellowView};
    NSArray *constraint_redView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView(100)]"
                                                                            options:0 metrics:nil
                                                                              views:viewsDictionary];
    NSArray *constraint_redView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[redView(100)]"
                                                                            options:0 metrics:nil
                                                                              views:viewsDictionary];
    
    NSArray *constraint_yellowView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[yellowView(100)]"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:viewsDictionary];
    NSArray *constraint_yellowView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[yellowView(150)]"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:viewsDictionary];
    [self.redView addConstraints:constraint_redView_V];
    [self.redView addConstraints:constraint_redView_H];
    [self.yellowView addConstraints:constraint_yellowView_V];
    [self.yellowView addConstraints:constraint_yellowView_H];


    // V:[redView]-30-[yellowView]-10-| 下
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-50-[redView]-30-[yellowView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    // H:|-50-[redView]-30-[yellowView]-30-| 两边
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-50-[redView]-30-[yellowView]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H];
}

- (void)example_3 {
    NSDictionary *viewsDictionary = @{@"redView": self.redView,
                                      @"yellowView": self.yellowView};
    NSArray *constraint_redView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView(100)]"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:viewsDictionary];
    NSArray *constraint_redView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[redView(100)]"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:viewsDictionary];
    NSArray *constraint_yellowView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[yellowView(100)]"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:viewsDictionary];
    NSArray *constraint_yellowView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[yellowView(150)]"
                                                                               options:0
                                                                               metrics:nil
                                                                                 views:viewsDictionary];
    [self.redView addConstraints:constraint_redView_V];
    [self.redView addConstraints:constraint_redView_H];
    [self.yellowView addConstraints:constraint_yellowView_V];
    [self.yellowView addConstraints:constraint_yellowView_H];
    
    NSArray *constraint_POS = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]-20-[yellowView]"
                                                                      options:NSLayoutFormatAlignAllBottom
                                                                      metrics:nil
                                                                        views:viewsDictionary];
    [self.view addConstraints:constraint_POS];
}

- (void)example_4 {
    NSDictionary *metrics = @{@"redWidth": @100,
                              @"redHeight": @100,
                              @"yellowWidth": @100,
                              @"yellowHeight": @120,
                              @"topMargin": @40,
                              @"leftMargin": @20,
                              @"viewSpacing":@10};
    NSDictionary *viewsDictionary = @{@"redView": self.redView,
                                      @"yellowView": self.yellowView};
    
    NSArray *constraint_redView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView(redHeight)]"
                                                                            options:0
                                                                            metrics:metrics
                                                                              views:viewsDictionary];
    NSArray *constraint_redView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[redView(redWidth)]"
                                                                            options:0
                                                                            metrics:metrics
                                                                              views:viewsDictionary];
    NSArray *constraint_yellowView_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[yellowView(yellowHeight)]"
                                                                               options:0
                                                                               metrics:metrics
                                                                                 views:viewsDictionary];
    NSArray *constraint_yellowView_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[yellowView(yellowWidth)]"
                                                                               options:0
                                                                               metrics:metrics
                                                                                 views:viewsDictionary];
    [self.redView addConstraints:constraint_redView_V];
    [self.redView addConstraints:constraint_redView_H];
    [self.yellowView addConstraints:constraint_yellowView_V];
    [self.yellowView addConstraints:constraint_yellowView_H];
    
    NSArray *constraint_topMargin = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topMargin-[redView]"
                                                                            options:0
                                                                            metrics:metrics
                                                                              views:viewsDictionary];
    NSArray *constraint_leftMargin = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftMargin-[redView]-viewSpacing-[yellowView]"
                                                                             options:NSLayoutFormatAlignAllTop
                                                                             metrics:metrics
                                                                               views:viewsDictionary];
    [self.view addConstraints:constraint_topMargin];
    [self.view addConstraints:constraint_leftMargin];
    
}

// Dynamic Size
- (void)example_5 {
    NSDictionary *viewsDictionary = @{@"redView": self.redView};
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[redView]-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[redView]-10-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H];
}

// center
- (void)example_6 {
    NSDictionary *viewsDictionary = @{@"redView": self.redView,
                                      @"yellowView": self.yellowView};
    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[redView]-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[redView]-10-|"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:viewsDictionary];
    [self.view addConstraints:constraint_POS_V];
    [self.view addConstraints:constraint_POS_H];
    
    NSLayoutConstraint *constraint_width = [NSLayoutConstraint constraintWithItem:self.yellowView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:self.redView
                                                                        attribute:NSLayoutAttributeWidth
                                                                       multiplier:0.5
                                                                         constant:0.0];
    NSLayoutConstraint *constraint_height = [NSLayoutConstraint constraintWithItem:self.yellowView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:self.redView
                                                                         attribute:NSLayoutAttributeHeight
                                                                        multiplier:0.5
                                                                          constant:0.0];
    NSLayoutConstraint *constraint_yellow_centerX = [NSLayoutConstraint constraintWithItem:self.yellowView
                                                                                 attribute:NSLayoutAttributeCenterX
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.redView
                                                                                 attribute:NSLayoutAttributeCenterX
                                                                                multiplier:1
                                                                                  constant:0];
    
    NSLayoutConstraint *constraint_yellow_centerY = [NSLayoutConstraint constraintWithItem:self.yellowView
                                                                                 attribute:NSLayoutAttributeCenterY
                                                                                 relatedBy:NSLayoutRelationEqual
                                                                                    toItem:self.redView
                                                                                 attribute:NSLayoutAttributeCenterY
                                                                                multiplier:1
                                                                                  constant:0];
    [self.view addConstraint:constraint_width];
    [self.view addConstraint:constraint_height];
    [self.view addConstraint:constraint_yellow_centerX];
    [self.view addConstraint:constraint_yellow_centerY];
}
@end
























