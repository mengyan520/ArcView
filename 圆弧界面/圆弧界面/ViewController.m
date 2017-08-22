//
//  ViewController.m
//  圆弧界面
//
//  Created by Youcai on 2017/7/25.
//  Copyright © 2017年 mm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self draw];
    //圆
    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(120,10, 80, 80)];
    view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view2.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(40,40)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = view2.bounds;
    maskLayer.path = maskPath.CGPath;
    view2.layer.mask = maskLayer;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0, 375, 380)];
    view.backgroundColor = [UIColor yellowColor];
    [self.view insertSubview:view atIndex:0];
}
//圆弧界面
- (void)draw {
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(0, 300, 375, 367)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    CGSize size = redView.frame.size;
    CGFloat startHeight = size.height * 0.2;
    CGFloat endHeight = size.height ;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, startHeight)];
    [path addLineToPoint:CGPointMake(0, endHeight)];
    [path addLineToPoint:CGPointMake(size.width, endHeight)];
    [path addLineToPoint:CGPointMake(size.width, startHeight)];
    [path addQuadCurveToPoint:CGPointMake(0, startHeight) controlPoint:CGPointMake(size.width/2, 0)];
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    //layer.strokeColor = [UIColor purpleColor].CGColor;
    //
    // layer.fillColor = [UIColor redColor].CGColor;
    layer.path = path.CGPath;
    
    //[redView.layer addSublayer:layer];
    redView.layer.mask = layer;
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
