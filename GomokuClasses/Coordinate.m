//
//  Coordinate.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "Coordinate.h"

@implementation Coordinate

+ (Coordinate*) createWithX:(NSUInteger)x andY:(NSUInteger)y {
    Coordinate *coordinate = [[Coordinate alloc] init];
    
    coordinate -> _x = x;
    coordinate -> _y = y;
    
    return coordinate;
}

@end
