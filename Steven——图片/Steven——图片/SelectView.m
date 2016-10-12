//
//  SelectView.m
//  Steven——图片
//
//  Created by qugo on 16/9/7.
//  Copyright © 2016年 steven. All rights reserved.
//

#import "SelectView.h"
#import "UIViewExt.h"

@implementation SelectView
{
    CGPoint beganPoint_sup;
    CGPoint beganPoint_self;
    
}


- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = [UIColor grayColor].CGColor;
        self.layer.borderWidth = 1;
     
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    beganPoint_sup = [[touches anyObject] locationInView:self.superview];
    beganPoint_self = [[touches anyObject] locationInView:self];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*
     ***情况1 （在视图中间）
     */
    
    CGPoint move_sup = [[touches anyObject] locationInView:self.superview];
    CGPoint change_point = CGPointMake(move_sup.x - beganPoint_sup.x, move_sup.y - beganPoint_sup.y);

    if (beganPoint_self.x >10 && beganPoint_self.x <_mark_size.width -10
        &&beganPoint_self.y >10 && beganPoint_self.y <_mark_size.height -10) {
        [self changeCenter:change_point touches:touches];
    }else{
        if (CGRectContainsPoint(self.superview.bounds, move_sup)) {
            [self changeSizeAndlocation:change_point withmovePoint:move_sup];
        }
        
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _mark_center = self.center;
    _mark_size = self.size;
    
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

//改变中心点
- (void)changeCenter:(CGPoint)changePoint touches:(NSSet *)touches{
    NSLog(@"%f  %f %f %f",self.left,self.top,self.right,self.bottom);
    
    self.center = CGPointMake(_mark_center.x+changePoint.x, _mark_center.y+changePoint.y);
    
    if (self.left <=0) {
        self.left = 0;
    }
    if (self.top <=0) {
        self.top = 0;
    }
    if (self.right >= self.superview.width) {
        self.right = self.superview.width;
    }
    if (self.bottom >= self.superview.height) {
        self.bottom = self.superview.height;
    }
    
}
- (void)changeSizeAndlocation:(CGPoint)changepoint withmovePoint:(CGPoint)move_sup{
    
    
    if (beganPoint_self.x <10) {//左边
        if (_mark_size.width - changepoint.x > 60) {
            self.width = _mark_size.width - changepoint.x;
            self.left = move_sup.x;
        }else{
            self.width = 60;
        }
    }else if(beganPoint_self.x >_mark_size.width -10){//右边
        if (_mark_size.width + changepoint.x > 60) {
            self.width = _mark_size.width + changepoint.x;
            self.right = move_sup.x;
        }else{
            self.width = 60;
        }
    }else{
        if (beganPoint_self.y <10) {//上边
            if (_mark_size.height - changepoint.y > 60) {
                self.height = _mark_size.height - changepoint.y;
                self.top = move_sup.y;
            }else{
                self.height = 60;
            }
            
        }else if(beganPoint_self.y > _mark_size.height -10){//下边

            if (_mark_size.height + changepoint.y > 60) {
                self.height = _mark_size.height + changepoint.y;
                if (move_sup.y >=60) {
                    self.bottom = move_sup.y;
                }else{
                    self.bottom = 60;
                }
                
            }else{
                self.height = 60;
            }
        }
    }
    if (self.width >= self.superview.width) {
        self.width = self.superview.width;
    }
    
    if (self.left <= 0) {
        self.left = 0;
    }
    if (self.right >= self.superview.width) {
        self.right = self.superview.width;
    }
    if (self.bottom >= self.superview.height) {
        self.bottom = self.superview.height;
    }
    if (self.top <= 0) {
        self.top = 0;
    }
    
}


@end
