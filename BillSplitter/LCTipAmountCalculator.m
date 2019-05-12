//
//  LCTip.m
//  TipCalculatorApp
//
//  Created by Luiz on 5/10/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "LCTipAmountCalculator.h"

@implementation LCTipAmountCalculator

- (instancetype)init
{
    self = [super init];
    if (self) {
        _amount = [NSDecimalNumber decimalNumberWithString: @"0.00"];;
        _tip = [NSDecimalNumber decimalNumberWithString: @"0.00"];
        _percentage = [NSDecimalNumber decimalNumberWithString: @"0.15"];
    }
    return self;
}

-(void) setPercentage:(NSDecimalNumber *)percentage{

    
    NSDecimalNumber * noNumber = [NSDecimalNumber notANumber];
    if([percentage  isEqualToNumber: noNumber]){
        _percentage = [NSDecimalNumber decimalNumberWithString: @"0.00"];
    } else {
        _percentage = [percentage decimalNumberByDividingBy:[NSDecimalNumber decimalNumberWithString: @"100"]] ;
    }

    _tip = [_amount decimalNumberByMultiplyingBy: _percentage];
}


@end
