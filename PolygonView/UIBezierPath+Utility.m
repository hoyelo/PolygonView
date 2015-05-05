//
//  UIBezierPath+Utility.m
//  PolygonView
//
//  Created by Victor Zhu on 5/3/15.
//  Copyright (c) 2015 IQI. All rights reserved.
//

#import "UIBezierPath+Utility.h"

@implementation UIBezierPath (Utility)

+ (UIBezierPath *)bezierPathWithPolygonInRect:(CGRect)rect numberOfSides:(NSUInteger)numberOfSides
{
	if (numberOfSides < 3) {
		[NSException raise:NSInvalidArgumentException format:@"Polygon requires numberOfSides to be 3 or greater"];
	}
	
	CGFloat xRadius = CGRectGetWidth(rect) / 2;
	CGFloat yRadius = CGRectGetHeight(rect) / 2;
	
	CGFloat centerX = CGRectGetMidX(rect);
	CGFloat centerY = CGRectGetMidY(rect);
	
	UIBezierPath *bezierPath = [UIBezierPath bezierPath];
	[bezierPath moveToPoint:CGPointMake(centerX + xRadius, centerY + 0)];
	for (NSUInteger i = 0; i < numberOfSides; i++) {
		CGFloat theta = 2 * M_PI / numberOfSides * i;
		CGFloat xCoordinate = centerX + xRadius * cosf(theta);
		CGFloat yCoordinate = centerY + yRadius * sinf(theta);
		[bezierPath addLineToPoint:CGPointMake(xCoordinate, yCoordinate)];
	}
	[bezierPath closePath];
	return bezierPath;
}

@end
