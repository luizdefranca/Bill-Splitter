//
//  ViewController.m
//  BillSplitter
//
//  Created by Luiz on 5/11/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;
@property (weak, nonatomic) IBOutlet UISlider *numberOfPeopleSlider;
@property (weak, nonatomic) IBOutlet UILabel *amountPerPersonTextField;
@property (weak, nonatomic) IBOutlet UITextField *percentageTextField;

@property (nonatomic, strong) BillSpliter * billSpliter;
@property (nonatomic, strong) NSDecimalNumber * percentage;
@property (nonatomic, strong) LCTipAmountCalculator *tipCalculator;

@property (weak, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.percentageTextField.delegate = self;
    self.billAmountTextField.delegate = self;
    self.billSpliter = [[BillSpliter alloc]init];
    self.tipCalculator = [[LCTipAmountCalculator alloc]init];
    [self.billAmountTextField becomeFirstResponder];
    self.amountPerPersonTextField.text = @"Amount per person: CA$";
    [self createReturnButton];
}

- (IBAction)changeNumberOfPeople:(UISlider *)sender {
    self.numberOfPeopleLabel.text = [NSString stringWithFormat: @"Number of people: %.f", self.numberOfPeopleSlider.value];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.billAmountTextField) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;
}


- (IBAction)calculateSplitAmount:(id)sender {
    self.billSpliter.billAmount = [NSDecimalNumber decimalNumberWithString: self.billAmountTextField.text];
    self.billSpliter.numberOfPeople =   [NSString stringWithFormat:@"%f", self.numberOfPeopleSlider.value ];
    self.tipCalculator.amount = [NSDecimalNumber decimalNumberWithString: self.billAmountTextField.text];
    self.tipCalculator.percentage = [NSDecimalNumber decimalNumberWithString: self.percentageTextField.text];

    NSLog( @"%@ splitAmount ->", [NSNumberFormatter
                   localizedStringFromNumber: self.billSpliter.splitAmount
                   numberStyle:NSNumberFormatterCurrencyStyle]);
    NSLog(@"%@ tip ->",[NSNumberFormatter
                 localizedStringFromNumber:self.tipCalculator.tip
                 numberStyle:NSNumberFormatterCurrencyStyle] );
    NSDecimalNumber *total = [self.billSpliter.splitAmount decimalNumberByAdding:self.tipCalculator.tip];
    self.amountPerPersonTextField.text =[NSNumberFormatter
                                         localizedStringFromNumber:total
                                         numberStyle:NSNumberFormatterCurrencyStyle];

}

-(void)createReturnButton {

    CGRect rect = CGRectMake(0, 0, self.view.frame.size.width, 50);
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 300, 50)];
    numberToolbar.barStyle = UIBarStyleBlackTranslucent;
    UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *returnItem =  [[UIBarButtonItem alloc]initWithTitle:@"Return" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad)];
    numberToolbar.items = @[spaceItem, returnItem];
    [numberToolbar sizeToFit];
   // self.billAmountTextField.inputAssistantItem = numberToolbar;
    self.billAmountTextField.inputAccessoryView  = numberToolbar;
}

-(void)doneWithNumberPad {
    [self.billAmountTextField resignFirstResponder];
}
@end
