//
//  CropView.m
//  Steven——图片
//
//  Created by qugo on 16/9/7.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "CropView.h"
#import "SelectView.h"

@implementation CropView
{
    UIImageView *imageView;
    SelectView  *selectView;
}


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.width,self.height)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        UIImage *image = [UIImage imageNamed:@"imge.png"];
        imageView.image = image;
        imageView.height = image.size.height/image.size.width *self.width;
        imageView.center = CGPointMake(self.width/2.0, self.height/2.0);
        
        [self addSubview:imageView];
        
        
        
        selectView = [[SelectView alloc] initWithFrame:CGRectMake(0, 0, self.width,200)];
        selectView.center = CGPointMake(self.width/2.0, self.height/2.0);
        selectView.mark_center = selectView.center;
        selectView.mark_size = selectView.size;
        selectView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:selectView];
        
    }
    return self;
}



@end
