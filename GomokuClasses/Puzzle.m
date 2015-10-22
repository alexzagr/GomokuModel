//
//  Puzzle.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 19.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "Puzzle.h"
#import "Cell.h"
#import "Player.h"
#import "Dimension.h"
#import "ConcreteCoordinate.h"

@interface Puzzle ()

@property (nonatomic, strong) NSMutableArray *winCombination;
@property (nonatomic, strong) NSMutableArray *horizontalLine;
@property (nonatomic, strong) NSMutableArray *verticalLine;
@property (nonatomic, strong) NSMutableArray *leftDiagonalLine;
@property (nonatomic, strong) NSMutableArray *rightDiagonalLine;

@end

@implementation Puzzle
@synthesize winCombination, horizontalLine, verticalLine, leftDiagonalLine, rightDiagonalLine;

- (id) init {
    self = [super init];
    
    if (self) {
        winCombination = [[NSMutableArray alloc] init];
        horizontalLine = [[NSMutableArray alloc] init];
        verticalLine = [[NSMutableArray alloc] init];
        leftDiagonalLine = [[NSMutableArray alloc] init];
        rightDiagonalLine = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+ (Puzzle*) createPuzzleWithRow:(NSUInteger)rowCount andColumn:(NSUInteger)columnCount {
    Puzzle *puzzle = [[Puzzle alloc] init];
    Dimension *dimension = [Dimension createWithWidth:rowCount andHeight:columnCount];
    
    NSMutableArray *tempArray = [NSMutableArray new];
    
    for (NSInteger countY = 1; countY < columnCount + 1; countY++) {
        
        for (NSInteger countX = 1; countX < rowCount + 1; countX++) {
            Coordinate *coordinate = [Coordinate createWithX:countX andY:countY];
            Cell *cell = [Cell createWithCoordinate:coordinate];
            
            ConcreteCoordinate *CCoordinate = [puzzle convertToCCordinate: coordinate withDimension:dimension];
            [tempArray insertObject:cell atIndex:[ConcreteCoordinate convertToIndex:CCoordinate
                                                                      withDimension:dimension]];
        }
        
    }
    
    puzzle -> _cells = [NSArray arrayWithArray:tempArray];
    puzzle -> _dimension = dimension;
    
    return puzzle;
}

- (ConcreteCoordinate*) convertToCCordinate: (Coordinate*) coordinate withDimension: (Dimension*) dimension {
    NSAssert((coordinate.x <= dimension.width) &&
             (coordinate.y <= dimension.height) &&
             ((coordinate.x > 0) && (coordinate.y > 0)), @"invalid coordinate");
    
    return [ConcreteCoordinate createWithCoordinate:coordinate andDimension:dimension];
}

- (Cell*) giveCellWith:(Coordinate *)coordinate {
    
    return [self.cells objectAtIndex:[ConcreteCoordinate convertToIndex:[self convertToCCordinate:coordinate
                                                                                    withDimension:_dimension]]];
}

- (void) markCellWithCoordinate:(Coordinate *)coordinate andPlayer:(Player *)player {
    Cell *cell = [self giveCellWith:coordinate];
    
    [cell markWithPlayer:player];
}

- (NSArray*) isBingo: (Coordinate*) coordinate andPlayer:(Player *)player {
    
    NSArray *arrays = @[horizontalLine, verticalLine, leftDiagonalLine, rightDiagonalLine];
    
    for (NSUInteger horizontalCounter = 1; horizontalCounter < self.dimension.width + 1; horizontalCounter++) {
        [horizontalLine addObject:[self giveCellWith:[Coordinate createWithX:horizontalCounter andY:coordinate.y]]];
    }
    
    for (NSUInteger verticalCounter = 1; verticalCounter < self.dimension.height + 1; verticalCounter++) {
        [verticalLine addObject:[self giveCellWith:[Coordinate createWithX:coordinate.x andY:verticalCounter]]];
    }
    
    ConcreteCoordinate *CCoordinate = [self convertToCCordinate:coordinate withDimension:_dimension];
    
    ConcreteCoordinate *topLeft = [CCoordinate topLeftCoordinate];
    ConcreteCoordinate *downRight = [CCoordinate downRightCoordinate];
    
    NSUInteger minus = [ConcreteCoordinate minus:topLeft CCoordinate:downRight];
    
    if (minus > 0) {
        for (NSInteger LDCount = 1; LDCount < minus + 1; LDCount++) {
            
            [leftDiagonalLine addObject:[self giveCellWith:[Coordinate createWithX:topLeft.x + LDCount
                                                                              andY:topLeft.y + LDCount]]];
        }
    }
    
    ConcreteCoordinate *downLeft = [CCoordinate downLeftCoordinate];
    ConcreteCoordinate *topRight = [CCoordinate topRightCoordinate];
    
    minus = [ConcreteCoordinate minus:downLeft CCoordinate:topRight];
    
    if (minus > 0) {
        for (NSUInteger RDCount = 1; RDCount < minus + 1; RDCount++) {
            [rightDiagonalLine addObject:[self giveCellWith:[Coordinate createWithX:topRight.x - RDCount
                                                                               andY:topRight.y + RDCount]]];
        }
    }
    
    
    for (NSInteger count = 0; count < [arrays count]; count++) {
        __block NSInteger tempCounter = 0;
        NSMutableArray *array = [arrays objectAtIndex:count];
        
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            Cell *cell = obj;
            if (cell.marked && [cell.owner isEqual:player]) {
                tempCounter++;
                
            } else {
                if (tempCounter >= 5) {
                    for (NSInteger forCounter = idx - tempCounter; forCounter < idx; forCounter++) {
                        [winCombination addObject:[array objectAtIndex:forCounter]];
                    }
                }
                
                tempCounter = 0;
            }
        }];
        
        [array removeAllObjects];
        tempCounter = 0;
    }
    
    return ([winCombination count] > 0) ? winCombination : nil;
}

@end
