//
//  ConcreteCoordinate.h
//  GomokuGame
//
//  Created by Alex Zagrebin on 20.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "Coordinate.h"

@class Dimension;
@interface ConcreteCoordinate : Coordinate

@property (nonatomic, strong) Dimension *dimension;

+ (ConcreteCoordinate*) createWithRow:(NSUInteger)row andColumn:(NSUInteger)column
                    andDimensionWidth:(NSUInteger) dimensionWidth andDimensionHeight:(NSUInteger) dimensionHeight;

+ (ConcreteCoordinate*) createWithCoordinate: (Coordinate*) coordinate andDimension: (Dimension*) dimension;

+ (NSUInteger) convertToIndex: (ConcreteCoordinate*) coordinate;
+ (NSUInteger) convertToIndex: (ConcreteCoordinate*) coordinate withDimension: (Dimension*) dimension;

- (ConcreteCoordinate*) topLeftCoordinate;
- (ConcreteCoordinate*) topRightCoordinate;
- (ConcreteCoordinate*) downLeftCoordinate;
- (ConcreteCoordinate*) downRightCoordinate;

+ (NSUInteger) minus: (ConcreteCoordinate*) CC1 CCoordinate:(ConcreteCoordinate*) CC2;

@end
