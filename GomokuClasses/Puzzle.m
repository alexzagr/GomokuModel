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

@property (nonatomic, strong) Dimension *dimension;
@property (nonatomic, strong) NSArray *cells;

@end

@implementation Puzzle

- (id) init {
    self = [super init];
    
    if (self) {
        _winCombination = [[NSMutableArray alloc] init];
        _horizontalLine = [[NSMutableArray alloc] init];
        _verticalLine = [[NSMutableArray alloc] init];
        _leftDiagonalLine = [[NSMutableArray alloc] init];
        _rightDiagonalLine = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+ (Puzzle*) createPuzzleWithRow:(NSUInteger)rowCount andColumn:(NSUInteger)columnCount {
    
    Puzzle *puzzle = [[Puzzle alloc] init];
    Dimension *dimension = [Dimension createWithWidth:rowCount andHeight:columnCount]; // Задаем размерность Puzzle
    
    NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:columnCount];
    for (NSInteger countY = 0; countY < columnCount; countY++) {
        NSMutableArray *innerArray = [NSMutableArray arrayWithCapacity:rowCount];
        
        for (NSInteger countX = 0; countX < rowCount; countX++) {
            
            Coordinate *coordinate = [Coordinate createWithX:countX + 1 andY:countY + 1];
            Cell *cell = [Cell createWithCoordinate:coordinate]; // Создаем объекты Cell и даем им свойство Coordinate
            
            [innerArray addObject:cell];
            
        }
        [tempArray addObject:innerArray];
        
    }
    
    puzzle.cells = [NSArray arrayWithArray:tempArray];
    puzzle.dimension = dimension;
    
    return puzzle;
}

- (ConcreteCoordinate*) convertToCCordinate: (Coordinate*) coordinate withDimension: (Dimension*) p_dimension {
    NSAssert((coordinate.x <= p_dimension.width) &&
             (coordinate.y <= p_dimension.height) &&
             ((coordinate.x > 0) && (coordinate.y > 0)), @"Invalid coordinate");
    
    return [ConcreteCoordinate createWithCoordinate:coordinate andDimension:self.dimension];
}

- (Cell*) giveCellWith:(Coordinate *)coordinate {
    
    return [[self.cells objectAtIndex:coordinate.y - 1] objectAtIndex:coordinate.x - 1];
}

- (void) markCellWithCoordinate:(Coordinate *)coordinate andPlayer:(Player *)player {
    NSAssert((coordinate.x <= self.dimension.width) &&
             (coordinate.y <= self.dimension.height) &&
             ((coordinate.x > 0) && (coordinate.y > 0)), @"Invalid coordinate");
    
    Cell *cell = [self giveCellWith:coordinate];
    
    [cell markWithPlayer:player];
}

- (NSArray*) isBingo: (Coordinate*) coordinate andPlayer:(Player *)player {
    
    // Здесь реализация алгоритма по нахождению выигрышной комбинации ячеек (Cell)
    
    NSArray *arrays = @[self.horizontalLine, self.verticalLine, self.leftDiagonalLine, self.rightDiagonalLine];
    
    for (NSUInteger horizontalCounter = 1; horizontalCounter < self.dimension.width + 1; horizontalCounter++) {
        [self.horizontalLine addObject:[self giveCellWith:[Coordinate createWithX:horizontalCounter andY:coordinate.y]]];
    }
    
    for (NSUInteger verticalCounter = 1; verticalCounter < self.dimension.height + 1; verticalCounter++) {
        [self.verticalLine addObject:[self giveCellWith:[Coordinate createWithX:coordinate.x andY:verticalCounter]]];
    }
    
    ConcreteCoordinate *CCoordinate = [self convertToCCordinate:coordinate withDimension:self.dimension];
    
    ConcreteCoordinate *topLeft = [CCoordinate topLeftCoordinate];
    ConcreteCoordinate *downRight = [CCoordinate downRightCoordinate];
    
    NSUInteger minus = [ConcreteCoordinate minus:topLeft CCoordinate:downRight];
    if (minus > 0) {
        for (NSInteger LDCount = 0; LDCount < minus + 1; LDCount++) {
            
            [self.leftDiagonalLine addObject:[self giveCellWith:[Coordinate createWithX:topLeft.x + LDCount
                                                                              andY:topLeft.y + LDCount]]];
        }
    }
    
    ConcreteCoordinate *downLeft = [CCoordinate downLeftCoordinate];
    ConcreteCoordinate *topRight = [CCoordinate topRightCoordinate];
    
    minus = [ConcreteCoordinate minus:downLeft CCoordinate:topRight];
    
    if (minus > 0) {
        for (NSUInteger RDCount = 0; RDCount < minus + 1; RDCount++) {
            [self.rightDiagonalLine addObject:[self giveCellWith:[Coordinate createWithX:topRight.x - RDCount
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
                        [self.winCombination addObject:[array objectAtIndex:forCounter]];
                    }
                }
                
                tempCounter = 0;
            }
            
            if (tempCounter >= 5 && ([array count] - 1 == idx)) {
                for (NSInteger forCounter = idx - (tempCounter - 1); forCounter < idx + 1; forCounter++) {
                    [self.winCombination addObject:[array objectAtIndex:forCounter]];
                }
            }
        }];
        
        [array removeAllObjects];
        tempCounter = 0;
    }
    
    return ([self.winCombination count] >= 5) ? self.winCombination : nil;
}

@end
