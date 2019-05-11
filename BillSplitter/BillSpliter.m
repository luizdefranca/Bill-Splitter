//
//  BillSpliter.m
//  BillSplitter
//
//  Created by Luiz on 5/11/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import "BillSpliter.h"

@implementation BillSpliter
- (instancetype)init
{
    self = [super init];
    if (self) {
        _billAmount =  [NSDecimalNumber decimalNumberWithString: @"0.00"];
        _numberOfPeople = @"1";
        _splitAmount = [NSDecimalNumber decimalNumberWithString: @"1.00"];
    }
    return self;
}

-(void) setNumberOfPeople:(NSString *)numberOfPeople{
    _numberOfPeople = numberOfPeople;
}

-(NSDecimalNumber * ) splitAmount {
    
    NSDecimalNumber *numberOfPeopleNSnumber =  [NSDecimalNumber decimalNumberWithString: _numberOfPeople];
    return [_billAmount decimalNumberByDividingBy: numberOfPeopleNSnumber];
}

@end
