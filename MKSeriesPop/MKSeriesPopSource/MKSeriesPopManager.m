//
//  MKSeriesPopManager.m
//  MKSeriesPop
//
//  Created by oracle on 2020/8/24.
//  Copyright © 2020 oracle. All rights reserved.
//

#import "MKSeriesPopManager.h"
@interface MKSeriesPopManager()
@property (nonatomic,strong)NSOperationQueue *popQueue;
@end
@implementation MKSeriesPopManager

- (instancetype)initSeriesPopManager {
    if (self = [super init]) {
        _popQueue = [[NSOperationQueue alloc] init];
        _popQueue.name = @"com.queue.pop";
        _popQueue.maxConcurrentOperationCount = 1;
    }
    return self;
}
- (void)addPopActionWithBlock:(void(^)(void))popAction {
    __weak typeof(MKSeriesPopManager *)weakSelf = self;
    NSBlockOperation * popOp = [NSBlockOperation blockOperationWithBlock:^{
        dispatch_async(dispatch_get_main_queue(), ^(){
            popAction();
        });
        [weakSelf.popQueue setSuspended:YES];
    }];
    [_popQueue addOperation:popOp];
}

- (void)nextPop {
    [_popQueue setSuspended:NO];
}
- (void)clearAllPop {
    [_popQueue cancelAllOperations];
}
@end
