# GomokuModel
Бета v 1.0

Это модель китайской логической игры с японским названием Гомоку или её русский аналог "Пять в ряд". Написана на Xcode 7 beta, Objective-C. Модель спроектирована в духе Design Pattern (MVC), потому чтобы использовать её достаточно написать свои Controllers и Views and Just Do It!

## Модель имеет следующий интерфейс
### Методы на входе
```
- (void) newGameWithSizeWidth: (NSInteger) width andHeight: (NSInteger) height; \\ Создать игровую сетку
- (void) turn: (Player* _Nonnull) player withCoordinate: (Coordinate* _Nonnull) coordinate; \\ Сделать ход
```
### Метод на выходе
```
@protocol GomokuGameModelProtocol <NSObject>
@required
- (void) winCells: (NSArray<__kindof Cell*> * _Nonnull ) cells;

@end

@interface GomokuGameModel : NSObject
...
...
@property (nonatomic, assign) id <GomokuGameModelProtocol> _Nullable delegate;
```
##Пример использования
```
#import "GomokuGameModel.h"

@interface ViewController () <GomokuGameModelProtocol>

@end

@implementation ViewController
//
- (void)viewDidLoad {
    [super viewDidLoad];
    
    Player *player = [Player createWithPlayerName:@"Player #1"];
    Coordinate *coordinate = [Coordinate createWithX:6 andY:7];
    
    [[GomokuGameModel shared] setDelegate:self];
    [[GomokuGameModel shared] newGameWithSizeWidth:15 andHeight:15];
    [[GomokuGameModel shared] turn:player withCoordinate:coordinate];
}

- (void) winCells: (NSArray<__kindof Cell*> * _Nonnull ) cells {
    
}

```
