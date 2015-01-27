//
//  MasonryViewController.m
//  AutoLayoutWithProgrammaticallyDemo
//
//  Created by YangCun on 15/1/27.
//  Copyright (c) 2015年 backslash112. All rights reserved.
//

#import "MasonryViewController.h"
#import "Masonry.h"

@interface MasonryViewController ()

@property (nonatomic, strong) UIView *redView;
@property (nonatomic, strong) UIView *yellowView;

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = YES;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [self setupViews];
    //    [self example_1];
    //    [self example_2];
    [self example_3];
    
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
    
    /*
     //    NSDictionary *viewsDictionary = @{@"redView": self.redView};
     //
     //    // part 1: Define the redView's height and width.
     //    NSArray *constraint_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[redView(100)]"
     //                                                                    options:0
     //                                                                    metrics:nil
     //                                                                      views:viewsDictionary];
     //    NSArray *constraint_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[redView(100)]"
     //                                                                    options:0
     //                                                                    metrics:nil
     //                                                                      views:viewsDictionary];
     //    [self.redView addConstraints:constraint_V];
     //    [self.redView addConstraints:constraint_H];
     //
     //    // part 2: Define the redView's position.
     //    NSArray *constraint_POS_V = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-30-[redView]"
     //                                                                        options:0
     //                                                                        metrics:nil
     //                                                                          views:viewsDictionary];
     //    NSArray *constraint_POS_H = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-20-[redView]"
     //                                                                        options:0
     //                                                                        metrics:nil
     //                                                                          views:viewsDictionary];
     //    [self.view addConstraints:constraint_POS_V];
     //    [self.view addConstraints:constraint_POS_H];
     */
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.left.mas_offset(70);
        make.top.mas_offset(80);
    }];
}

- (void)example_2 {
    
    /*
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
     */
    
    
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        
        make.top.mas_offset(30);
        make.left.mas_offset(10);
        make.bottom.equalTo(self.yellowView.mas_top).mas_offset(-10);
        make.right.equalTo(self.yellowView.mas_left).mas_offset(-10);
    }];
    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 150));
    }];
    
}

- (void)example_3 {
    /*
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
     options:NSLayoutFormatAlignAllTop
     metrics:nil
     views:viewsDictionary];
     [self.view addConstraints:constraint_POS];
     */
    
    [self.redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(10); // 等价于 make.top.equalTo(self.view.mas_top).mas_offset(10);
        make.left.mas_offset(10);
        make.bottom.mas_offset(-10);
        
        make.right.equalTo(self.yellowView.mas_left).with.mas_offset(-5);
        make.width.mas_equalTo(self.yellowView.mas_width); // 关键的一句代码
    }];
    
    [self.yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_offset(-10);
        make.top.mas_offset(10);
        make.bottom.mas_offset(-10);
    }];
    
}





















@end
