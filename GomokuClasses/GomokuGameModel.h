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
- (void) winCells: (NSArray<__kindof Cell*> * _Nonnull ) cells;

@end

@interface GomokuGameModel : NSObject

@property (strong, readonly) Puzzle  * _Nullable puzzle;

@property (nonatomic, assign) id <GomokuGameModelProtocol> _Nullable delegate;


+ (GomokuGameModel* _Nonnull) shared;

- (void) newGameWithSizeWidth: (NSInteger) width andHeight: (NSInteger) height;
- (void) turn: (Player* _Nonnull) player withCoordinate: (Coordinate* _Nonnull) coordinate;

@end
