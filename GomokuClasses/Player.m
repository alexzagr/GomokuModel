//
//  Player.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "Player.h"

@interface Player ()

@property (strong, nonatomic, readwrite) NSString *playerName;

@end

@implementation Player
@synthesize playerName;

+ (Player*) createWithPlayerName:(NSString *)name {
    Player *player = [[Player alloc] init];
    
    player.playerName = name;
    
    return player;
}

@end
