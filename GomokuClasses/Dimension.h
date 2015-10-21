//
//  Dimension.h
//  GomokuGame
//
//  Created by Alex Zagrebin on 20.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dimension : NSObject

@property (nonatomic, assign, readonly) NSInteger width;
@property (nonatomic, assign, readonly) NSInteger height;

+ (Dimension*) createWithWidth: (NSInteger) width andHeight: (NSInteger) height;

@end