//
//  Cell.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "Cell.h"

@implementation Cell

+ (Cell*) createWithCoordinate:(Coordinate *)coordinate {
    Cell *cell = [[Cell alloc] init];
    
    cell -> _marked = NO;
    cell -> _coordinate = coordinate;
    
    return cell;
}

- (void) markWithPlayer:(Player *)player {
    self -> _marked = YES;
    self -> _owner = player;
}

@end
