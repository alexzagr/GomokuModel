//
//  Dimension.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 20.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "Dimension.h"

@implementation Dimension

+ (Dimension*) createWithWidth:(NSInteger)width andHeight:(NSInteger)height {
    Dimension *dimension = [[Dimension alloc] init];
    
    dimension -> _width = width;
    dimension -> _height = height;
    
    return dimension;
}

@end
