//
//  ManualRotateViewController.m
//  RotateOneVC
//
//  Created by CoderXu on 16/8/14.
//  Copyright © 2016年 CoderXu. All rights reserved.
//  手动切换控制器

#import "ManualRotateViewController.h"
#import "PortraitBaseViewController.h"

@interface ManualRotateViewController ()
@property(nonatomic,assign,getter=isPortrait) BOOL portrait;//
@end

@implementation ManualRotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.portrait = YES;
    /*注意,横屏时[UIScreen mainScreen].bounds的宽高并不是view的宽高*/
    UITextView *view1 = [[UITextView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-100, 65, 100, 30)];
    [self.view addSubview:view1];
    view1.backgroundColor = [UIColor redColor];
    view1.text = @"点我测试";
    

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillDisappear:(BOOL)animated {
    //界面消失时,切换回竖屏,不影响前一个/后一个控制器的界面,也不影响输入法....
    self.portrait = YES;
    SEL selector = NSSelectorFromString(@"setOrientation:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:[UIDevice currentDevice]];
    int val = UIDeviceOrientationPortrait;
    //从2开始是因为0 1 两个参数已经被selector和target占用
    [invocation setArgument:&val atIndex:2];
    [invocation invoke];
}
- (IBAction)rotate:(id)sender {    
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        if (self.isPortrait) {//当前是竖屏,则切换为横屏
            self.portrait = false;
            [[UIDevice currentDevice] performSelector:@selector(setOrientation:) withObject:[NSNumber numberWithInteger:UIInterfaceOrientationMaskLandscapeLeft]];
        }else {//当前是横屏,则切换为竖屏
            self.portrait = YES;
            SEL selector = NSSelectorFromString(@"setOrientation:");
            NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
            [invocation setSelector:selector];
            [invocation setTarget:[UIDevice currentDevice]];
            int val = UIDeviceOrientationPortrait;
            //从2开始是因为0 1 两个参数已经被selector和target占用
            [invocation setArgument:&val atIndex:2];
            [invocation invoke];
        }
    }
    
//     //如果是全屏,可以用transform来只旋转控制器的view,不影响前一个/后一个的界面,但是会影响输入法....
//    if (self.portrait) {
//        self.portrait = NO;
//        self.view.transform = CGAffineTransformMakeRotation(M_PI/2);
//        self.view.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
//    }else {
//        self.portrait = YES;
//        self.view.transform = CGAffineTransformMakeRotation(0.0);
//        self.view.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    }
    
}
//-(BOOL)shouldAutorotate {//与上面的transform配合使用,以免modal后出现错误
//    return NO;
//}

- (IBAction)pushToNext:(id)sender {
    PortraitBaseViewController *vc = [[PortraitBaseViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)modalToNext:(id)sender {
    PortraitBaseViewController *vc = [[PortraitBaseViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    if (self.isPortrait) {//当前竖屏不让自动切换,只能保持竖屏
        return UIInterfaceOrientationMaskPortrait;
    }else {//当前横屏不让自动切换,只能保持横屏
        return UIInterfaceOrientationMaskLandscape;
    }
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
