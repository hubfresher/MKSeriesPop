//
//  MKSeriesPopManager.h
//  MKSeriesPop
//
//  Created by oracle on 2020/8/24.
//  Copyright © 2020 oracle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MKSeriesPopManager : NSObject
//不使用singleton了
- (instancetype)initSeriesPopManager;

//pop
- (void)addPopActionWithBlock:(void(^)(void))popAction;

- (void)nextPop;
//clear
- (void)clearAllPop;
@end

NS_ASSUME_NONNULL_END
