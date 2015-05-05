//
//  UIBezierPath+Utility.h
//  PolygonView
//
//  Created by Victor Zhu on 5/3/15.
//  Copyright (c) 2015 IQI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (Utility)

+ (UIBezierPath *)bezierPathWithPolygonInRect:(CGRect)rect numberOfSides:(NSUInteger)numberOfSides;

@end
