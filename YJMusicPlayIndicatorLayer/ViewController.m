//
//  ViewController.m
//  YJMusicPlayIndicatorLayer
//
//  Created by Jet on 16/1/21.
//  Copyright © 2016年 Jet. All rights reserved.
//

#import "ViewController.h"
#import "YJMusicPlayIndicatorLayer.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    YJMusicPlayIndicatorLayer *musicPlay = [YJMusicPlayIndicatorLayer indicatorLayer];
    musicPlay.bounds = CGRectMake(0, 0, 60, 60);
    musicPlay.position = CGPointMake(150, 150);
    [self.view.layer addSublayer:musicPlay];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
