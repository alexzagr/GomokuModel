//
//  Puzzle.h
//  GomokuGame
//
//  Created by Alex Zagrebin on 19.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Coordinate, Player;
@interface Puzzle : NSObject

+ (Puzzle*) createPuzzleWithRow: (NSUInteger) rowCount andColumn: (NSUInteger) columnCount;

- (void) markCellWithCoordinate: (Coordinate*) coordinate andPlayer: (Player*) player;
- (NSArray*) isBingo: (Coordinate*) coordinate andPlayer:(Player*) player;

@end
