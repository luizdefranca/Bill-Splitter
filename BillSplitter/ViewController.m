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
@property (nonatomic, strong) BillSpliter * billSpliter;

@property (weak, nonatomic) IBOutlet UILabel *numberOfPeopleLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.billSpliter = [[BillSpliter alloc]init];
    [self.billAmountTextField becomeFirstResponder];
    self.amountPerPersonTextField.text = @"Amount per person: CA$";

}

- (IBAction)changeNumberOfPeople:(UISlider *)sender {
    self.numberOfPeopleLabel.text = [NSString stringWithFormat: @"Number of people: %.f", self.numberOfPeopleSlider.value];
}


- (IBAction)calculateSplitAmount:(id)sender {
    self.billSpliter.billAmount = [NSDecimalNumber decimalNumberWithString: self.billAmountTextField.text];
    self.billSpliter.numberOfPeople =   [NSString stringWithFormat:@"%.2f", self.numberOfPeopleSlider.value ];
    NSLog( @"%@", [NSString stringWithFormat: @"%@", [self.billSpliter splitAmount] ]);

    self.amountPerPersonTextField.text = [NSString stringWithFormat:@"%.2f", self.billSpliter.splitAmount.doubleValue  ];
}


@end
