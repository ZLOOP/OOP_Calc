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
    
    NSString *arg1;     //数字列1用
    NSString *arg2;     //数字列2用
    NSString *ope;      //演算子用
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
    return nil;
}

/*--------------------------------------------*/
// resetFlags
// 引数:(NSString *)value
// 返数:void
//
// valueについてフラグの確認，修正をするメソッド．addMethods内のみ．
/*--------------------------------------------*/
- (void)resetFlags:(NSString *)value{
}

#pragma mark - 入力関係
/*--------------------------------------------*/
// setNumber
// 引数:(NSNumber *)value
// 返数:NSString *
//
// 数字入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)setNumber:(NSString *)value{
    return nil;
}

/*--------------------------------------------*/
// setNumber0
// 引数:(NSNumber *)value
// 返数:NSString *
//
// 0入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)setNumber0:(NSString *)value{
    return nil;
}


/*--------------------------------------------*/
// setOperation
// 引数:(NSNumber *)value
// 返数:void
//
// 演算子入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)setOperation:(NSString *)value{
    return nil;
}

/*--------------------------------------------*/
// setPoint
// 引数:なし
// 返数:NSString *
//
// 小数点入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)setPoint{
    return nil;
}

/*--------------------------------------------*/
// turnSign
// 引数:なし
// 返数:NSString *
//
// +/-入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)turnSign{
    return nil;
}

#pragma mark - その他
/*--------------------------------------------*/
// calculation
// 引数:なし
// 返数:NSString *
//
// arg1 ope arg2 の数式の計算を行うメソッド．
/*--------------------------------------------*/
- (NSString *)calculation{
    return nil;
}



@end
