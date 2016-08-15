//
//  ViewController.m
//  RotateOneVC
//
//  Created by CoderXu on 16/8/14.
//  Copyright © 2016年 CoderXu. All rights reserved.
//

#import "ViewController.h"
#import "PortraitBaseViewController.h"
#import "AutoRotateViewController.h"
#import "ManualRotateViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}
//本界面只支持竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}
//push出只能竖屏的控制器
- (IBAction)pushToNoRotateVC:(id)sender {
    PortraitBaseViewController *vc = [[PortraitBaseViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
//modal出只能竖屏的控制器
- (IBAction)modalToNoRotateVC:(id)sender {
    PortraitBaseViewController *vc = [[PortraitBaseViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
//push出一个能自动切换的控制器(跟随系统横竖屏)
- (IBAction)pushToRotateVC:(id)sender {
    AutoRotateViewController *vc = [[AutoRotateViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
//modal出一个能自动切换的控制器(跟随系统横竖屏)
- (IBAction)modalToRotateVC:(id)sender {
    AutoRotateViewController *vc = [[AutoRotateViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
//push出一个手动切换屏幕方向的控制器(不跟随系统)
- (IBAction)pushToManualRotateVC:(id)sender {
    ManualRotateViewController *vc = [[ManualRotateViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
//modal出一个手动切换屏幕方向的控制器(不跟随系统)
- (IBAction)modalToManualRotateVC:(id)sender {
    ManualRotateViewController *vc = [[ManualRotateViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
