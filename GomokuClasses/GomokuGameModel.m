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

@property (strong, readwrite) Puzzle  * _Nonnull puzzle;

@end

@implementation GomokuGameModel
@synthesize puzzle, delegate;

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
    if (!delegate) return;
    [self.puzzle markCellWithCoordinate:coordinate andPlayer:player];

    NSArray *array;
    if ((array = [self.puzzle isBingo:coordinate andPlayer:player]) != nil) {
        [self winCells:array];
    }
    
}

- (void) winCells:(NSArray<__kindof Cell *> *)cells {
    if ([self.delegate respondsToSelector:@selector(winCells:)]) {
        [self.delegate performSelector:@selector(winCells:) withObject:cells];
    }
}

@end
