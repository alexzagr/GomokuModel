//
//  Coordinate.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "Coordinate.h"

@interface Coordinate ()

@property (nonatomic, assign, readwrite) NSUInteger x;
@property (nonatomic, assign, readwrite) NSUInteger y;

@end

@implementation Coordinate
@synthesize x,y;

+ (Coordinate*) createWithX:(NSUInteger)x andY:(NSUInteger)y {
    Coordinate *coordinate = [[Coordinate alloc] init];
    
    coordinate.x = x;
    coordinate.y = y;
    
    return coordinate;
}

@end
