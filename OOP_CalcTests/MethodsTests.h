//
//  MethodsTests.h
//  OOP_Calc
//

#import <SenTestingKit/SenTestingKit.h>

@interface MethodsTests : SenTestCase{
    
}


#pragma mark - 初期化
- (NSString *)allClearTests;

#pragma mark - 入力関係
- (NSString *)setNumberTests:(NSString *)value;      //数字用
- (NSString *)setNumber0Tests:(NSString *)value;     //0用
- (NSString*)setOperationTests:(NSString *)value;    //演算子用
- (NSString *)setPointTests;                         //小数点用
- (NSString *)turnSignTests;                         //符号用

#pragma mark - その他
- (NSString *)calculationTests;  //計算をする

@end
