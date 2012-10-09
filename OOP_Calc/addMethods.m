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
#define answer 4

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
        //ないとき
        pointFlag = NO;
    }else{
        //あるとき
        pointFlag = YES;
    }
    
    if (pointFlag == NO) {
        // valueの後ろは0かどうか
        if([value hasPrefix:@"0"]){
            zeroFlag = NO;
        }else{
            zeroFlag = YES;
        }
    }else {
        zeroFlag = NO;
    }
}

#pragma mark - その他
/*--------------------------------------------*/
// dropFractions
// 引数:(NSString *)value
// 返数:(NSString *)value
//
// valueの無駄な0と少数点を消す．addMethods内のみ．
/*--------------------------------------------*/
- (NSString *)dropFractions:(NSString *)value{
    NSLog(@"now");
    while (pointFlag == YES) {
        NSLog(@"value:%@",value);
        if ([value hasSuffix:@"0"]) value = [value substringToIndex:(value.length - 1)];
        if ([value hasSuffix:@"."]){
            value = [value substringToIndex:(value.length - 1)];
            break;
        }else{
            break;
        }
    }
    NSLog(@"finish");
    return value;
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
        case answer:
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
        case answer:
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
            }else{
                temp = arg2;
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
            
        case answer:
            break;
            
        default:
            break;
    }
    ope = value;
    [self resetFlags:@"0"];
    STATE = opeState;
    NSLog(@"arg1:%@",arg1);
    NSLog(@"State = opeState");
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
        
        case answer://
            
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
        case answer:
            arg = [arg1 doubleValue];
            arg = (arg * (-1));
            arg1 = [NSString stringWithFormat:@"%f",arg];
            arg1 = [self dropFractions:arg1];
            temp = arg1;
            break;
            
        case opeState:
            temp = nil;
            break;
            
        case arg2State:
            arg = [arg2 doubleValue];
            arg = (arg * (-1));
            arg2 = [NSString stringWithFormat:@"%f",arg];
            arg2 = [self dropFractions:arg2];
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
    NSLog(@"%@ %@ %@",arg1,ope, arg2);

    double temp;
    if (ope == nil) {
    }else{
        if ([ope isEqualToString:@"+"]) temp = [arg1 doubleValue] + [arg2 doubleValue];
        if ([ope isEqualToString:@"-"]) temp = [arg1 doubleValue] - [arg2 doubleValue];
        if ([ope isEqualToString:@"*"]) temp = [arg1 doubleValue] * [arg2 doubleValue];
        if ([ope isEqualToString:@"/"]) temp = [arg1 doubleValue] / [arg2 doubleValue];
        arg1 = [NSString stringWithFormat:@"%f",temp];
    }
    [self resetFlags:arg1];
    arg1 = [self dropFractions:arg1];
    [self resetFlags:arg1];
    ope = nil;
    arg2 = nil;
    STATE = answer;
    
    NSLog(@"answer:%@",arg1);
    return arg1;
}



@end
