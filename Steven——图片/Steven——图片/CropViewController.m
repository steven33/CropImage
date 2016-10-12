//
//  CropViewController.m
//  Steven——图片
//
//  Created by qugo on 16/9/7.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "CropViewController.h"
#import "CropView.h"
#import "SelectView.h"
#import "ShowVC.h"
#define Kheight   [[UIScreen mainScreen] bounds].size.height
#define Kwidth   [[UIScreen mainScreen] bounds].size.width
@interface CropViewController ()
{
    UIImageView *imageView;
    SelectView  *selectView;
    CGFloat  suoxiaobeishu;
}

@end

@implementation CropViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.width,self.view.height)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = self.cropImage;
    imageView.height = self.cropImage.size.height/self.cropImage.size.width *self.view.width;
    imageView.center = CGPointMake(self.view.width/2.0, self.view.height/2.0);
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    
    suoxiaobeishu = self.cropImage.size.height/imageView.height;
    
    selectView = [[SelectView alloc] initWithFrame:CGRectMake(0, 0, self.view.width,200)];
    selectView.center = CGPointMake(self.view.width/2.0, imageView.height/2.0);
    selectView.mark_center = selectView.center;
    selectView.mark_size = selectView.size;
    selectView.contentMode = UIViewContentModeScaleAspectFit;
    [imageView addSubview:selectView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, Kheight - 100, 100, 40)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (void)buttonAction:(UIButton *)sender{
    
    NSLog(@"%f %f %f %f ",imageView.left,imageView.top,imageView.width,imageView.height);
    NSLog(@"%f %f %f %f ",selectView.left,selectView.top,selectView.width,selectView.height);
    
    float change_left = (selectView.left -imageView.left)*suoxiaobeishu;
    float change_top = selectView.top*suoxiaobeishu;
    float change_right = (imageView.right - selectView.right)*suoxiaobeishu;
    float change_botton = (imageView.height - selectView.bottom)*suoxiaobeishu;
    
    CGRect cropRect= CGRectMake(change_left,
               change_top,
               imageView.image.size.width - (change_left + change_right),
               imageView.image.size.height - (change_top + change_botton));
    UIImage *cropImage = [self clipImageInRect:cropRect forImage:self.cropImage];
    ShowVC *showVC = [[ShowVC alloc] init];
    showVC.cropImage = cropImage;
    [self.navigationController pushViewController:showVC animated:YES];
}

//截取图片的某一部分
- (UIImage *)clipImageInRect:(CGRect)rect forImage:(UIImage *)firstImage
{
    CGImageRef imageRef = CGImageCreateWithImageInRect([firstImage CGImage], rect);
    UIImage *thumbScale = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return thumbScale;
}


@end
