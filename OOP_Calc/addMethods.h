//
//  addMethods.h
//  OOP_Calc
//

#import <Foundation/Foundation.h>

@interface addMethods : NSObject{
}

#pragma mark - 初期化
- (NSString *)allClear;

#pragma mark - 入力関係
- (NSString *)setNumber:(NSNumber *)value;      //数字用
- (void)setOperation:(NSNumber *)value;         //演算子用
- (NSString *)setPoint;                         //小数点用
- (NSString *)turnSign;                         //符号用

- (void)substituteViewValue:(NSString *)temp ForArg:(NSNumber *)num;    //arg1か2にtempを代入する

#pragma mark - その他
- (NSString *)calculation;  //計算をする

@end
