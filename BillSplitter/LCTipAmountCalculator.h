//
//  LCTip.h
//  TipCalculatorApp
//
//  Created by Luiz on 5/10/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCTipAmountCalculator : NSObject {
    NSDecimalNumber * _tip;
}
@property (nonatomic) NSDecimalNumber* amount;
@property (nonatomic, readonly) NSDecimalNumber * tip;
@property (nonatomic) NSDecimalNumber * percentage;

//-(void) setPercentage:(NSDecimalNumber *)percentage;
@end

NS_ASSUME_NONNULL_END
