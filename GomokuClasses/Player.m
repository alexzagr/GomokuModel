//
//  Player.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "Player.h"

@implementation Player

+ (Player*) createWithPlayerName:(NSString *)name {
    Player *player = [[Player alloc] init];
    
    player -> _playerName = name;
    
    return player;
}

@end
