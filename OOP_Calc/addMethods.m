//
//  addMethods.m
//  OOP_Calc
//

#import "addMethods.h"

//状態遷移用のマクロ
#define initialState 0
#define arg1State 1
#define opeState 2
#define arg2State 3

@implementation addMethods{
    NSInteger STATE;    //現在の状態
    
    BOOL pointFlag;     //小数点用フラグ
    BOOL zeroFlag;      //先頭の0用フラグ
    
    NSNumber *arg1;     //数字列1用
    NSNumber *arg2;     //数字列2用
    NSNumber *ope;      //演算子用
}

#pragma mark - 初期化

/*--------------------------------------------*/
// allClear
// 引数:なし
// 返数:NSString *
//
// 全てを初期化するメソッド．
/*--------------------------------------------*/
- (NSString *)allClear{
    STATE = initialState;
    arg1 = @0;
    pointFlag = NO;
    zeroFlag = YES;
    return [arg1 stringValue];
}

/*--------------------------------------------*/
// resetFlags
// 引数:(NSNumber *)value
// 返数:void
//
// valueについてフラグの確認，修正をするメソッド．addMethods内のみ．
/*--------------------------------------------*/
- (void)resetFlags:(NSNumber *)value{
}

#pragma mark - 入力関係
/*--------------------------------------------*/
// setNumber
// 引数:(NSNumber *)value
// 返数:NSString *
//
// 数字入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)setNumber:(NSNumber *)value{
    return @"0";
}

/*--------------------------------------------*/
// setOperation
// 引数:(NSNumber *)value
// 返数:void
//
// 演算子入力に対するメソッド．
/*--------------------------------------------*/
- (void)setOperation:(NSNumber *)value{
    
}

/*--------------------------------------------*/
// setPoint
// 引数:なし
// 返数:NSString *
//
// 小数点入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)setPoint{
    return @"0";    
}

/*--------------------------------------------*/
// turnSign
// 引数:なし
// 返数:NSString *
//
// 小数点入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)turnSign{
    return @"0";    
}

/*--------------------------------------------*/
// turnSign
// 引数:temp,num
// 返数:void
//
// 数字列tempをarg(num)に保存するメソッド．
/*--------------------------------------------*/
- (void)substituteViewValue:(NSString *)temp ForArg:(NSNumber *)num{
    
}

#pragma mark - その他
/*--------------------------------------------*/
// turnSign
// 引数:なし
// 返数:NSString *
//
// arg1 ope arg2 の数式の計算を行うメソッド．
/*--------------------------------------------*/
- (NSString *)calculation{
    return @"0";    
}



@end
