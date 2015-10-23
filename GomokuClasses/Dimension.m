//
//  Dimension.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 20.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "Dimension.h"

@interface Dimension ()

@property (nonatomic, assign, readwrite) NSInteger width;
@property (nonatomic, assign, readwrite) NSInteger height;

@end

@implementation Dimension
@synthesize width,height;

+ (Dimension*) createWithWidth:(NSInteger)width andHeight:(NSInteger)height {
    Dimension *dimension = [[Dimension alloc] init];
    
    dimension.width = width;
    dimension.height = height;
    
    return dimension;
}

@end
