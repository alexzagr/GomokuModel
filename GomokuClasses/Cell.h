//
//  Cell.h
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Player, Coordinate;
@interface Cell : NSObject

@property (nonatomic, strong, readonly) Coordinate *coordinate;
@property (nonatomic, strong, readonly) Player *owner;
@property (nonatomic, assign, readonly) BOOL marked;

+ (Cell*) createWithCoordinate: (Coordinate*) coordinate;
- (void) markWithPlayer: (Player*) player;

@end
