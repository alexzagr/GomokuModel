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

@property (nonatomic, strong) Player *player;

@property (nonatomic, strong) IBOutlet UILabel *labelX;
@property (nonatomic, strong) IBOutlet UILabel *labelY;
@property (nonatomic, strong) IBOutlet UILabel *labelBingo;

@property (nonatomic, strong) IBOutlet UIButton *tapper;

@end

@implementation ViewController

- (void) winCells: (NSArray<__kindof Cell*> * _Nonnull ) cells {
    self.labelBingo.hidden = NO;
    
    for (Cell *winCell in cells) {
        NSLog(@"CX = %@, CY = %@", @(winCell.coordinate.x).stringValue, @(winCell.coordinate.y).stringValue);
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tapper addTarget:self action:@selector(turn) forControlEvents:UIControlEventTouchUpInside];
    
    self.player = [Player createWithPlayerName:@"Alex"];
    [[GomokuGameModel shared] setDelegate:self];
    [[GomokuGameModel shared] newGameWithSizeWidth:50 andHeight:50];
}

- (void) turn {
    static NSInteger count = 23;
    
    for (NSInteger cc = count; cc < count+1; cc++) {
        Coordinate *coordinate = [Coordinate createWithX:cc andY:cc];
        
        self.labelX.text = [NSString stringWithFormat:@"X: %@", @(coordinate.x).stringValue];
        self.labelY.text = [NSString stringWithFormat:@"Y: %@", @(coordinate.y).stringValue];
        
        [[GomokuGameModel shared] turn:self.player withCoordinate:coordinate];
    }
    
    count++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
