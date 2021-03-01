//
//  ViewController.m
//  MKSeriesPop
//
//  Created by oracle on 2020/8/24.
//  Copyright © 2020 oracle. All rights reserved.
//

#import "ViewController.h"
#import "MKSeriesPopManager.h"
@interface ViewController ()
@property(nonatomic,strong)MKSeriesPopManager * popM;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _popM = [[MKSeriesPopManager alloc] initSeriesPopManager];
    __weak typeof(ViewController *)weakSelf = self;
    for (int i = 1; i < 11; i++) {
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [weakSelf.popM addPopActionWithBlock:^{
                [weakSelf testAlert:@(i).stringValue];
            }];
        });
    }
    
    [_popM addPopActionWithBlock:^{
        [weakSelf testAlert:@"x"];
    }];

}
- (void)testAlert:(NSString*)titleI {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:titleI message:@"点击确定继续后续弹框，点击取消取消后续弹框" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *conform = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了确认按钮");
        [self.popM nextPop];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击了取消按钮");
        [self.popM clearAllPop];
    }];
    [alert addAction:conform];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
