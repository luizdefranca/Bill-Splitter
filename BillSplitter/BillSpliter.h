//
//  BillSpliter.h
//  BillSplitter
//
//  Created by Luiz on 5/11/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BillSpliter : NSObject {
    NSDecimalNumber * _splitAmount;
    NSDecimalNumber * _billAmount;
}

@property (nonatomic, strong) NSDecimalNumber *billAmount;
@property (nonatomic, assign) NSString * numberOfPeople;
@property (nonatomic, strong, readonly) NSDecimalNumber *splitAmount;


@end

NS_ASSUME_NONNULL_END
