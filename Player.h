//
//  Player.h
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (strong, nonatomic, readonly) NSString *playerName;

+ (Player*) createWithPlayerName: (NSString*) name;

@end
