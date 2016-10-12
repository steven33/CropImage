//
//  ViewController.m
//  Steven——图片
//
//  Created by qugo on 16/9/7.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "ViewController.h"
#import "CropView.h"
#import "CropViewController.h"
#define Kheight   [[UIScreen mainScreen] bounds].size.height
#define Kwidth   [[UIScreen mainScreen] bounds].size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonAction:(UIButton *)sender{
    
    CropViewController *vc = [[CropViewController alloc] init];
    vc.cropImage = [UIImage imageNamed:@"imge.png"];
    
    UINavigationController *na = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:na animated:YES completion:nil];
    
}


@end
