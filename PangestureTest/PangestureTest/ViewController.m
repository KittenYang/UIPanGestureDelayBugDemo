//
//  ViewController.m
//  PangestureTest
//
//  Created by Kitten x iDaily on 16/12/20.
//  Copyright © 2016年 KittenYang. All rights reserved.
//

#import "ViewController.h"
#import "MMUIPanGestureRecognizer.h"

@interface ViewController ()

@property (nonatomic, weak)MMUIPanGestureRecognizer *panGes;

@property (nonatomic, weak)UITapGestureRecognizer *tapGes;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    testView.backgroundColor = [UIColor redColor];
    testView.center = self.view.center;
    [self.view addSubview:testView];

    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [testView addGestureRecognizer:(self.tapGes = tapGR)];
    
    // subclass UIPanGestureRecognizer
    MMUIPanGestureRecognizer *panGes = [[MMUIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    
    // UIPanGestureRecognizer
//    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [testView addGestureRecognizer:(self.panGes = panGes)];
    
}

- (void)handlePan:(MMUIPanGestureRecognizer *)panGes {
    panGes.view.center = [panGes locationInView:self.view];
}

- (void)handleTapGesture:(UITapGestureRecognizer *)tapGR {
    tapGR.view.backgroundColor = [UIColor colorWithRed:arc4random() % 2 green:arc4random() % 2 blue:arc4random() % 2 alpha:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
