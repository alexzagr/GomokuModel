//
//  ViewController.m
//  GomokuGame
//
//  Created by Alex Zagrebin on 17.10.15.
//  Copyright © 2015 Alex Zagrebin. All rights reserved.
//

#import "ViewController.h"
#import "GomokuGameModel.h"
#import "Cell.h"

@interface ViewController () <GomokuGameModelProtocol>

@end

@implementation ViewController

- (void) winCells: (NSArray<__kindof Cell*> * _Nonnull ) cells {
    for (Cell *winCell in cells) {
        NSLog(@"CX = %@, CY = %@", @(winCell.coordinate.x).stringValue, @(winCell.coordinate.y).stringValue);
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[GomokuGameModel shared] setDelegate:self];
    [[GomokuGameModel shared] newGameWithSizeWidth:5 andHeight:10];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(turn)]];
}

- (void) turn {
    static NSInteger count = 1;
    
    Player *player = [Player createWithPlayerName:@"Alex"];
    for (NSInteger cc = count; cc < count+1; cc++) {
        Coordinate *coordinate = [Coordinate createWithX:5 andY:cc];
        
        [[GomokuGameModel shared] turn:player withCoordinate:coordinate];
    }
    
    count++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
