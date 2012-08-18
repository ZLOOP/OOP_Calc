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
}

- (IBAction)number1Button_down:(id)sender {
}

- (IBAction)number2Button_down:(id)sender {
}

- (IBAction)number3Button_down:(id)sender {
}

- (IBAction)number4Button_down:(id)sender {
}

- (IBAction)numberButton5_down:(id)sender {
}

- (IBAction)number6Button_down:(id)sender {
}

- (IBAction)number7Button_down:(id)sender {
}

- (IBAction)number8Button_down:(id)sender {
}

- (IBAction)number9Button_down:(id)sender {
}
- (IBAction)addButton_down:(id)sender {
}

- (IBAction)subButton_down:(id)sender {
}

- (IBAction)mulButton_down:(id)sender {
}

- (IBAction)divButton_down:(id)sender {
}
- (IBAction)signButton_down:(id)sender {
}

- (IBAction)pointButton_down:(id)sender {
}

- (IBAction)equalButton_down:(id)sender {
}

- (IBAction)allclearButton_down:(id)sender {
}
@end
