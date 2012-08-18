//
//  ViewController.m
//  OOP_Calc
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    addMethods *_addMethods;
}

//ビューがロードされた時に実行される
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _addMethods = [addMethods alloc];   //メモリの確保
    valueViewLabrl.text = [_addMethods allClear];//初期化
}

- (void)viewDidUnload
{
    valueViewLabrl = nil;
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

// ----------------------------------------
// トリガー
// ----------------------------------------

- (IBAction)number0Button_down:(id)sender {
    valueViewLabrl.text = [_addMethods setNumber:@0];
}

- (IBAction)number1Button_down:(id)sender {
    valueViewLabrl.text = [_addMethods setNumber:@1];
}

- (IBAction)number2Button_down:(id)sender {
    valueViewLabrl.text = [_addMethods setNumber:@2];
}

- (IBAction)number3Button_down:(id)sender {
    valueViewLabrl.text = [_addMethods setNumber:@3];
}

- (IBAction)number4Button_down:(id)sender {
    valueViewLabrl.text = [_addMethods setNumber:@4];
}

- (IBAction)numberButton5_down:(id)sender {
    valueViewLabrl.text = [_addMethods setNumber:@5];
}

- (IBAction)number6Button_down:(id)sender {
    valueViewLabrl.text = [_addMethods setNumber:@6];
}

- (IBAction)number7Button_down:(id)sender {
    valueViewLabrl.text = [_addMethods setNumber:@7];
}

- (IBAction)number8Button_down:(id)sender {
    valueViewLabrl.text = [_addMethods setNumber:@8];
}

- (IBAction)number9Button_down:(id)sender {
    valueViewLabrl.text = [_addMethods setNumber:@9];
}

- (IBAction)addButton_down:(id)sender {
    [_addMethods setOperation:@"+"];
}

- (IBAction)subButton_down:(id)sender {
    [_addMethods setOperation:@"-"];
}

- (IBAction)mulButton_down:(id)sender {
    [_addMethods setOperation:@"*"];
}

- (IBAction)divButton_down:(id)sender {
    [_addMethods setOperation:@"/"];
}

- (IBAction)signButton_down:(id)sender {
    valueViewLabrl.text = [_addMethods turnSign];
}

- (IBAction)pointButton_down:(id)sender {
    valueViewLabrl.text = [_addMethods setPoint];
}

- (IBAction)equalButton_down:(id)sender {
    valueViewLabrl.text = [_addMethods calculation];
}

- (IBAction)allclearButton_down:(id)sender {
    valueViewLabrl.text = [_addMethods allClear];
}
@end
