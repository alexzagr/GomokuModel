//
//  Coordinate.h
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coordinate : NSObject {
@protected NSUInteger _x, _y;
}

@property (nonatomic, assign, readonly) NSUInteger x;
@property (nonatomic, assign, readonly) NSUInteger y;

+ (Coordinate*) createWithX:(NSUInteger) x andY: (NSUInteger) y;

@end
