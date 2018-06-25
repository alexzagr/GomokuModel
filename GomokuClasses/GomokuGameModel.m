//
//  GomokuGameModel.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "GomokuGameModel.h"
#import "Puzzle.h"

@interface GomokuGameModel () <GomokuGameModelProtocol>

@property (strong, readwrite) Puzzle  *puzzle;

@end

@implementation GomokuGameModel

- (instancetype) init {
    self = [super init];
    
    if (self) {
        self.puzzle = nil;
        self.delegate = nil;
    }
    
    return self;
}

+ (GomokuGameModel*) shared {
    static GomokuGameModel *model;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        model = [[GomokuGameModel alloc] init];
    });
    
    return model;
}


- (void) newGameWithSizeWidth:(NSInteger)width andHeight:(NSInteger)height {
    self.puzzle = [Puzzle createPuzzleWithRow:width andColumn:height];
}

- (void) turn: (Player*) player withCoordinate: (Coordinate*) coordinate {
    if (!self.delegate) return;                                                  // если обратная связь не установлена, то выходим
    [self.puzzle markCellWithCoordinate:coordinate andPlayer:player];       // помечаем ячейку (Cell) игроком (Player)

    NSArray *array;
    if ((array = [self.puzzle isBingo:coordinate andPlayer:player]) != nil) { // если есть выигрышная комбинация ячеек
        [self winCells:array];                                                // то оповещаем разработчика //
    }
    
}

- (void) winCells:(NSArray<__kindof Cell *> *)cells {
    if ([self.delegate respondsToSelector:@selector(winCells:)]) {
        [self.delegate performSelector:@selector(winCells:) withObject:cells];
    }
}

@end
