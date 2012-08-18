//
//  ViewController.h
//  OOP_Calc
//

#import <UIKit/UIKit.h>
#import "addMethods.h"

@interface ViewController : UIViewController{
    __weak IBOutlet UILabel *valueViewLabrl;    //表示用のラベル
}

//数字のトリガー
- (IBAction)number0Button_down:(id)sender;      // 0
- (IBAction)number1Button_down:(id)sender;      // 1
- (IBAction)number2Button_down:(id)sender;      // 2
- (IBAction)number3Button_down:(id)sender;      // 3
- (IBAction)number4Button_down:(id)sender;      // 4
- (IBAction)numberButton5_down:(id)sender;      // 5
- (IBAction)number6Button_down:(id)sender;      // 6
- (IBAction)number7Button_down:(id)sender;      // 7
- (IBAction)number8Button_down:(id)sender;      // 8
- (IBAction)number9Button_down:(id)sender;      // 9
//演算子のトリガー
- (IBAction)addButton_down:(id)sender;          // +
- (IBAction)subButton_down:(id)sender;          // -
- (IBAction)mulButton_down:(id)sender;          // ×
- (IBAction)divButton_down:(id)sender;          // ÷
//その他のトリガー
- (IBAction)signButton_down:(id)sender;         // +/-
- (IBAction)pointButton_down:(id)sender;        // .
- (IBAction)equalButton_down:(id)sender;        // =
- (IBAction)allclearButton_down:(id)sender;     // AC

@end
