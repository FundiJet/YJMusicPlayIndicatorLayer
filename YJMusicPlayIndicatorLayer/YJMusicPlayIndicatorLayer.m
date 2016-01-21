//
//  YJMusicPlayIndicatorLayer.m
//  YJMusicPlayIndicatorLayer
//
//  Created by Jet on 16/1/21.
//  Copyright © 2016年 Jet. All rights reserved.
//

#import "YJMusicPlayIndicatorLayer.h"

@interface YJMusicPlayIndicatorLayer ()

@property (nonatomic, strong, readwrite) CALayer *indicatorBarLayer;
@property (nonatomic, strong) CABasicAnimation *move;

@end

@implementation YJMusicPlayIndicatorLayer
+ (instancetype)indicatorLayer {
    return [[self alloc] init];
}
- (instancetype)init {
    if (self = [super init]) {
        _indicatorBarLayer = ({
            CALayer *layer = [CALayer new];
            [self addSublayer:layer];
            layer;
        });
        [self configureProperties];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self setupAnimation];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.indicatorBarLayer addAnimation:_move forKey:@"Move"];
            });
        });
    }
    return self;
}

- (void)configureProperties {
    self.masksToBounds = YES;
    _indicatorBarLayer.backgroundColor = [UIColor redColor].CGColor;
    _indicatorBarLayer.bounds = CGRectMake(0, 0, 8, 40);
    _indicatorBarLayer.cornerRadius = 2;
    _indicatorBarLayer.position = CGPointMake(10, 75);
    self.instanceCount = 3;
    self.instanceDelay = 0.5;
    self.instanceTransform = CATransform3DMakeTranslation(15, 0, 0);
}

- (void)setupAnimation {
    CABasicAnimation *move = [CABasicAnimation animationWithKeyPath:@"position.y"];
    move.duration = 0.7;
    move.autoreverses = YES;
    move.repeatCount = CGFLOAT_MAX;
    CGFloat toValue = self.indicatorBarLayer.position.y - 35;
    move.toValue = @(toValue);
    _move = move;
}

@end
