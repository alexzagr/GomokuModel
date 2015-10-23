//
//  Cell.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "Cell.h"

@interface Cell ()

@property (nonatomic, strong, readwrite) Coordinate *coordinate;
@property (nonatomic, strong, readwrite) Player *owner;
@property (nonatomic, assign, readwrite) BOOL marked;

@end

@implementation Cell
@synthesize coordinate,owner,marked;

+ (Cell*) createWithCoordinate:(Coordinate *)coordinate {
    Cell *cell = [[Cell alloc] init];
    
    cell.marked = NO;
    cell.coordinate = coordinate;
    
    return cell;
}

- (void) markWithPlayer:(Player *)player {
    self.marked = YES;
    self.owner = player;
}

@end
