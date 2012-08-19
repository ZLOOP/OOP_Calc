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
- (NSString *)setNumber:(NSString *)value;      //数字用
- (NSString *)setNumber0:(NSString *)value;     //0用
- (NSString*)setOperation:(NSString *)value;    //演算子用
- (NSString *)setPoint;                         //小数点用
- (NSString *)turnSign;                         //符号用

#pragma mark - その他
- (NSString *)calculation;  //計算をする

@end
