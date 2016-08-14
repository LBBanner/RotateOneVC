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
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

- (IBAction)pushToNoRotateVC:(id)sender {
    PortraitBaseViewController *vc = [[PortraitBaseViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)modalToNoRotateVC:(id)sender {
    PortraitBaseViewController *vc = [[PortraitBaseViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)pushToRotateVC:(id)sender {
    AutoRotateViewController *vc = [[AutoRotateViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)modalToRotateVC:(id)sender {
    AutoRotateViewController *vc = [[AutoRotateViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)pushToManualRotateVC:(id)sender {
    ManualRotateViewController *vc = [[ManualRotateViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)modalToManualRotateVC:(id)sender {
    ManualRotateViewController *vc = [[ManualRotateViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
