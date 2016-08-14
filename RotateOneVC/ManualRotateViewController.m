//
//  ManualRotateViewController.m
//  RotateOneVC
//
//  Created by CoderXu on 16/8/14.
//  Copyright © 2016年 CoderXu. All rights reserved.
//

#import "ManualRotateViewController.h"
#import "PortraitBaseViewController.h"

@interface ManualRotateViewController ()
@property(nonatomic,assign) int portrait;//   1 == 全屏  3 == 竖屏
@end

@implementation ManualRotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.portrait = 1;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)rotate:(id)sender {    
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        if (self.portrait == 1) {
            self.portrait = 3;
        }else {
            self.portrait = 1;
        }
        
        SEL selector = NSSelectorFromString(@"setOrientation:");
        
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        
        [invocation setSelector:selector];
        
        [invocation setTarget:[UIDevice currentDevice]];
        [invocation setArgument:&(_portrait) atIndex:2];
        [invocation invoke];
    }
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:self completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
