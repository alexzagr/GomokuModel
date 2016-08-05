//
//  GomokuGameModel.h
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Coordinate.h"
#import "Player.h"

@class Puzzle, Cell;
@protocol GomokuGameModelProtocol <NSObject>
@required
- (void) winCells: (NSArray<__kindof Cell*> *) cells;

@end

@interface GomokuGameModel : NSObject

@property (strong, readonly) Puzzle  *puzzle;
@property (nonatomic, assign) id <GomokuGameModelProtocol> delegate;


+ (GomokuGameModel*) shared;

- (void) newGameWithSizeWidth: (NSInteger) width andHeight: (NSInteger) height;
- (void) turn: (Player*) player withCoordinate: (Coordinate*) coordinate;

@end
