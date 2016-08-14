//
//  PortraitBaseViewController.m
//  RotateOneVC
//
//  Created by CoderXu on 16/8/14.
//  Copyright © 2016年 CoderXu. All rights reserved.
//

#import "PortraitBaseViewController.h"

@interface PortraitBaseViewController ()

@end

@implementation PortraitBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)dismiss:(id)sender {
    [self dismissViewControllerAnimated:self completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
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
