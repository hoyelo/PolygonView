//
//  ViewController.m
//  PolygonView
//
//  Created by Victor Zhu on 4/22/15.
//  Copyright (c) 2015 IQI. All rights reserved.
//

#import "ViewController.h"
#import "UIBezierPath+Utility.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
	CGRect bounds = self.view.bounds;
	CGFloat width = 120;
	UIView *polygonView = [[UIView alloc] initWithFrame:CGRectMake((CGRectGetWidth(bounds) - width) / 2, 20, width, width)];
	polygonView.layer.masksToBounds = YES;
	polygonView.layer.borderColor = [UIColor grayColor].CGColor;
	polygonView.layer.borderWidth = 1 / [UIScreen mainScreen].scale;
	polygonView.backgroundColor = [UIColor greenColor];
	[self.view addSubview:polygonView];
	
	// Create path
//	UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectInset(polygonView.bounds, 59, 59)];
//	UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:polygonView.bounds byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(45, 45)];
//	UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:polygonView.bounds cornerRadius:45];
//	UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 80, 40)];
//	UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(width / 2, width / 2) radius:width / 2 startAngle:0 * M_PI endAngle:1 * M_PI clockwise:NO];
	UIBezierPath *path = [UIBezierPath bezierPathWithPolygonInRect:polygonView.bounds numberOfSides:6];

	// Move to original point
	[path applyTransform:CGAffineTransformMakeTranslation(-CGRectGetWidth(polygonView.bounds) / 2, -CGRectGetHeight(polygonView.bounds) / 2)];
	
	// Rotate path
	[path applyTransform:CGAffineTransformMakeRotation(M_PI_2)];
	
	// Move back
	[path applyTransform:CGAffineTransformMakeTranslation(CGRectGetWidth(polygonView.bounds) / 2, CGRectGetHeight(polygonView.bounds) / 2)];
	
	CAShapeLayer *shape = [CAShapeLayer layer];
	shape.path = path.CGPath;
	polygonView.layer.mask = shape;
	
	UIView *subView = [[UIView alloc] initWithFrame:CGRectInset(polygonView.bounds, 20, 20)];
	subView.backgroundColor = [UIColor redColor];
	[polygonView addSubview:subView];
}

@end
