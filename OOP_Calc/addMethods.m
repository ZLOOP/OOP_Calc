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
    STATE = initialState;
    arg1 = @"0";
    [self resetFlags:arg1];
    return arg1;
}

/*--------------------------------------------*/
// resetFlags
// 引数:(NSString *)value
// 返数:void
//
// valueについてフラグの確認，修正をするメソッド．addMethods内のみ．
/*--------------------------------------------*/
- (void)resetFlags:(NSString *)value{
    // 小数点があるかどうか
    NSRange searchResult = [value rangeOfString:@"."];
    if(searchResult.location == NSNotFound){
        pointFlag = NO;
    }else{
        pointFlag = YES;
    }

    if (pointFlag == NO) {
        // valueの先頭は0かどうか
        if([value hasPrefix:@"0"]){
            zeroFlag = YES;
        }else{
            zeroFlag = NO;
        }
    }else {
        zeroFlag = NO;
    }
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
    NSString *temp;
    switch (STATE) {
        case initialState://arg1にvalueで上書き
            arg1 = value;
            temp = arg1;
            zeroFlag = NO;
            STATE = arg1State;
            break;
            
        case arg1State://arg1とvalueを結合
            arg1 = [arg1 stringByAppendingString:value];
            temp = arg1;
            STATE = arg1State;
            break;
            
        case opeState://arg2にvalueで上書き
            arg2 = value;
            temp = arg2;
            STATE = arg2State;
            break;
            
        case arg2State://arg2とvalueを結合
            arg2 = [arg2 stringByAppendingString:value];
            temp = arg2;
            STATE = arg2State;
            break;
            
        default:
            break;
    }
    return temp;
}

/*--------------------------------------------*/
// setNumber0
// 引数:(NSNumber *)value
// 返数:NSString *
//
// 0入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)setNumber0:(NSString *)value{
    NSString *temp;
    switch (STATE) {
        case initialState:
            arg2 = value;
            temp = arg2;
            zeroFlag = YES;
            STATE = initialState;
            break;
            
        case arg1State://arg1とvalueを結合
            if (zeroFlag == NO) {
                arg1 = [arg1 stringByAppendingString:value];
                temp = arg1;
                STATE = arg1State;
            }else{
                temp = arg1;
            }
            break;
            
        case opeState://arg2にvalueで上書き
            arg2 = value;
            temp = arg2;
            zeroFlag = YES;
            STATE = arg2State;
            break;
            
        case arg2State://arg2とvalueを結合
            if (zeroFlag == NO) {
                arg2 = [arg2 stringByAppendingString:value];
                temp = arg2;
                STATE = arg2State;
            }
            break;
            
        default:
            break;
    }
    return temp;
}


/*--------------------------------------------*/
// setOperation
// 引数:(NSNumber *)value
// 返数:void
//
// 演算子入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)setOperation:(NSString *)value{
    NSString *temp = nil;
    switch (STATE) {
        case initialState:
            break;
            
        case arg1State:
            break;
            
        case opeState:
            break;
            
        case arg2State:
            temp =[self calculation];
            [self resetFlags:temp];
            break;
            
        default:
            break;
    }
    ope = value;
    [self resetFlags:@"0"];
    STATE = opeState;
    return temp;
}

/*--------------------------------------------*/
// setPoint
// 引数:なし
// 返数:NSString *
//
// 小数点入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)setPoint{
    NSString *temp;
    
    if (pointFlag == YES) {
        return nil;
    }
    
    switch (STATE) {
        case initialState://arg1にvalueで上書き
            arg1 = [arg1 stringByAppendingString:@"."];
            temp = arg1;
            STATE = arg1State;
            break;
        case arg1State://arg1とvalueを結合
            arg1 = [arg1 stringByAppendingString:@"."];
            temp = arg1;
            break;
            
        case opeState://arg2にvalueで上書き
            arg2 = @"0.";
            temp = arg2;
            STATE = arg2State;
            break;
        case arg2State://arg2とvalueを結合
            arg2 = [arg2 stringByAppendingString:@"."];
            temp = arg2;
            break;
            
        default:
            break;
    }
    pointFlag = YES;
    zeroFlag = NO;
    return temp;
}

/*--------------------------------------------*/
// turnSign
// 引数:なし
// 返数:NSString *
//
// +/-入力に対するメソッド．
/*--------------------------------------------*/
- (NSString *)turnSign{
    NSString *temp;
    double arg;
    switch (STATE) {
        case initialState:
            temp = nil;
            break;
            
        case arg1State:
            arg = [arg1 doubleValue];
            arg = (arg * (-1));
            arg1 = [NSString stringWithFormat:@"%f",arg];
            for (; [[arg1 substringFromIndex:(arg1.length - 1)] isEqualToString:@"0"]; ) {
                if ([arg1 hasSuffix:@"0"]) arg1 = [arg1 substringToIndex:(arg1.length - 1)];
                if ([arg1 hasSuffix:@"."]) arg1 = [arg1 substringToIndex:(arg1.length - 1)];
            }
            temp = arg1;
            break;
            
        case opeState:
            temp = nil;
            break;
            
        case arg2State:
            arg = [arg2 doubleValue];
            arg = (arg * (-1));
            arg2 = [NSString stringWithFormat:@"%f",arg];
            for (; [[arg2 substringFromIndex:(arg2.length - 1)] isEqualToString:@"0"]; ) {
                if ([arg2 hasSuffix:@"0"]) arg2 = [arg2 substringToIndex:(arg2.length - 1)];
                if ([arg2 hasSuffix:@"."]) arg2 = [arg2 substringToIndex:(arg2.length - 1)];
            }
            temp = arg2;
            break;
            
        default:
            break;
    }

    return temp;
}

#pragma mark - その他
/*--------------------------------------------*/
// calculation
// 引数:なし
// 返数:NSString *
//
// arg1 ope arg2 の数式の計算を行うメソッド．
/*--------------------------------------------*/
- (NSString *)calculation{ //FIXME:double型だと桁数が足りない可能性有り
    double temp;
    if ([ope isEqualToString:@"+"]) temp = [arg1 doubleValue] + [arg2 doubleValue];
    if ([ope isEqualToString:@"-"]) temp = [arg1 doubleValue] - [arg2 doubleValue];
    if ([ope isEqualToString:@"*"]) temp = [arg1 doubleValue] * [arg2 doubleValue];
    if ([ope isEqualToString:@"/"]) temp = [arg1 doubleValue] / [arg2 doubleValue];
    arg1 = [NSString stringWithFormat:@"%f",temp];
    [self resetFlags:arg1];
    STATE = arg1State;
    return arg1;
}



@end
