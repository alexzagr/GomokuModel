//
//  ConcreteCoordinate.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 20.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "ConcreteCoordinate.h"
#import "Dimension.h"

@interface ConcreteCoordinate ()

@property (nonatomic, assign, readwrite) NSUInteger x;
@property (nonatomic, assign, readwrite) NSUInteger y;

@end

@implementation ConcreteCoordinate
@dynamic x,y;

+ (ConcreteCoordinate*) createWithRow:(NSUInteger)row andColumn:(NSUInteger)column
                    andDimensionWidth:(NSUInteger) dimensionWidth andDimensionHeight:(NSUInteger) dimensionHeight {
    
    ConcreteCoordinate *coordinate = [[ConcreteCoordinate alloc] init];
    Dimension *dimension = [Dimension createWithWidth:dimensionWidth andHeight:dimensionHeight];
    
    coordinate.x = row;
    coordinate.y = column;
    coordinate.dimension = dimension;
    
    return coordinate;
}

+ (ConcreteCoordinate*) createWithCoordinate: (Coordinate*) coordinate andDimension: (Dimension*) dimension {
    ConcreteCoordinate *concreteCoordinate = [ConcreteCoordinate createWithRow:coordinate.x
                                                                     andColumn:coordinate.y
                                                             andDimensionWidth:dimension.width
                                                            andDimensionHeight:dimension.height];
    
    
    return concreteCoordinate;
}

+ (NSUInteger) convertToIndex:(ConcreteCoordinate *)coordinate{
    return (((coordinate.y - 1) * coordinate.dimension.width) + coordinate.x);
}

+ (NSUInteger) convertToIndex:(ConcreteCoordinate *)coordinate withDimension:(Dimension *)dimension {
    return (((coordinate.y - 1) * dimension.width) + coordinate.x);
}

- (ConcreteCoordinate*) topLeftCoordinate {
    ConcreteCoordinate *coordinate = [ConcreteCoordinate createWithRow:self.x andColumn:self.y
                                                     andDimensionWidth:self.dimension.width
                                                    andDimensionHeight:self.dimension.height];
    
    NSUInteger min = MIN(coordinate.x, coordinate.y) - 1;
    
    coordinate.x -= min;
    coordinate.y -=min;
    
    return coordinate;
}

- (ConcreteCoordinate*) topRightCoordinate {
    ConcreteCoordinate *coordinate = [ConcreteCoordinate createWithRow:self.x andColumn:self.y
                                                     andDimensionWidth:self.dimension.width
                                                    andDimensionHeight:self.dimension.height];
    
    NSUInteger summ = coordinate.x + coordinate.y;
    NSUInteger min;
    
    if (summ <= coordinate.dimension.width) {
        min = coordinate.y - 1;
        
    } else if (summ > coordinate.dimension.width) {
        min = coordinate.dimension.width - coordinate.x;
        
    }
    
    coordinate.x += min;
    coordinate.y -= min;
    
    return coordinate;
}

- (ConcreteCoordinate*) downLeftCoordinate {
    
    ConcreteCoordinate *coordinate = [ConcreteCoordinate createWithRow:self.x andColumn:self.y
                                                     andDimensionWidth:self.dimension.width
                                                    andDimensionHeight:self.dimension.height];
    
    NSUInteger summ = coordinate.x + coordinate.y;
    NSUInteger min;
    
    if (summ <= coordinate.dimension.height) {
        min = coordinate.x - 1;
        
    } else if (summ > coordinate.dimension.height) {
        min = coordinate.dimension.height - coordinate.y;
    }
    
    coordinate.x -= min;
    coordinate.y += min;
    
    return coordinate;
}

- (ConcreteCoordinate*) downRightCoordinate {
    ConcreteCoordinate *coordinate = [ConcreteCoordinate createWithRow:self.x andColumn:self.y
                                                     andDimensionWidth:self.dimension.width
                                                    andDimensionHeight:self.dimension.height];
    
    NSUInteger min;
    if (coordinate.y > coordinate.x) {
        min = coordinate.dimension.height - coordinate.y;
        
    } else if (coordinate.x > coordinate.y) {
        min = coordinate.dimension.width - coordinate.x;
        
    } else if (coordinate.x == coordinate.y) {
        min = MIN(coordinate.dimension.width, coordinate.dimension.height) - coordinate.x;
    }
    
    coordinate.x += min;
    coordinate.y +=min;
    
    return coordinate;
}

+ (NSUInteger) minus:(ConcreteCoordinate *)CC1 CCoordinate:(ConcreteCoordinate *)CC2 {
    NSUInteger diffr = MAX(CC1.x, CC2.x) - MIN(CC1.x, CC2.x);
    NSUInteger diffc = MAX(CC1.y, CC2.y) - MIN(CC1.y, CC2.y);
    
    NSAssert(diffc==diffr, @"error");
    
    return diffr;
}

@end
