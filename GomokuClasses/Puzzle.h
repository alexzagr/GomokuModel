//
//  Puzzle.h
//  GomokuGame
//
//  Created by Alex Zagrebin on 19.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Cell, Coordinate, Player, Dimension;
@interface Puzzle : NSObject

@property (strong, readonly) Dimension *dimension;
@property (strong, readonly) NSArray *cells;

+ (Puzzle*) createPuzzleWithRow: (NSUInteger) rowCount andColumn: (NSUInteger) columnCount;

- (Cell*) giveCellWith: (Coordinate*) coordinate;

- (void) markCellWithCoordinate: (Coordinate*) coordinate andPlayer: (Player*) player;

- (NSArray*) isBingo: (Coordinate*) coordinate andPlayer:(Player*) player;

@end
