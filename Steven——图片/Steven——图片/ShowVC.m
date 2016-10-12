//
//  ShowVC.m
//  Steven——图片
//
//  Created by qugo on 16/9/7.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "ShowVC.h"
#import "UIViewExt.h"

@interface ShowVC ()

@end

@implementation ShowVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width,self.view.height)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = self.cropImage;
    imageView.center = CGPointMake(self.view.width/2.0, self.view.height/2.0);
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
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
