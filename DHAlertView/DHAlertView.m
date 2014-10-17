//
//  DHAlertView.m
//  DHAlertView
//
//  Created by 胡大函 on 14-9-24.
//  Copyright (c) 2014年 Dahan@misol. All rights reserved.
//

#import "DHAlertView.h"

#define kBackgroundWidth [[UIScreen mainScreen] bounds].size.width
#define kBackgroundHeigth [[UIScreen mainScreen] bounds].size.height
#define kAlertWidth 245.0f
#define kAlertHeight 160.0f

@interface DHAlertView ()

@property (nonatomic, copy) dispatch_block_t dismissBlock;
@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, strong) UIView *alertContentView;
@property (nonatomic, strong) UIView *alertTitleView;
@property (nonatomic, strong) UILabel *alertTitleLable;
@property (nonatomic, strong) UILabel *alertContentLable;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UITapGestureRecognizer *tapSelf;

@end

@implementation UIImage (colorImage)

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end

@implementation DHAlertView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
#define kVerticleMargin 5.0f
#define kTitleHeight 25.0f
#define kContentHeight 30.0f

- (id)initWithTitle:(NSString *)title contentView:(id)content completion:(dispatch_block_t)completion {
    if (self = [super init]) {
        UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
        if (orientation == UIDeviceOrientationPortrait || orientation == UIDeviceOrientationUnknown) {
            self.frame = CGRectMake(0, 0, kBackgroundWidth, kBackgroundHeigth);
        } else {
            //8.0以后使用[[UIScreen mainScreen] bounds]获取的屏幕的宽高是根据当前设备的横竖屏状态动态计算的
            if ([[[UIDevice currentDevice] systemVersion] floatValue] > 7.0) {
                self.frame = CGRectMake(0, 0, kBackgroundWidth, kBackgroundHeigth);
            } else {
                self.frame = CGRectMake(0, 0, kBackgroundHeigth, kBackgroundWidth);
            }
        }
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.8];
        self.tapSelf = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissAlert:)];
        self.tapSelf.numberOfTapsRequired = 1;
        [self addGestureRecognizer:self.tapSelf];
        
        self.alertView = [[UIView alloc] initWithFrame:CGRectZero];
        
        self.alertTitleLable = [[UILabel alloc] initWithFrame:CGRectZero];
        self.alertTitleLable.font = [UIFont boldSystemFontOfSize:20.0f];
        self.alertTitleLable.textColor = [UIColor colorWithRed:56.0/255.0 green:64.0/255.0 blue:71.0/255.0 alpha:1];
        self.alertTitleLable.textAlignment = NSTextAlignmentCenter;
        self.alertTitleLable.text = title;
        if (title) {
            if ([content isKindOfClass:[UIView class]]) {
                
                self.alertTitleLable.frame = CGRectMake(0, kVerticleMargin, ((UIView *)content).frame.size.width, kTitleHeight);
                ((UIView *)content).frame = CGRectMake(0, kVerticleMargin*2 + kTitleHeight, ((UIView *)content).frame.size.width, ((UIView *)content).frame.size.height);
                self.alertView.frame  = CGRectMake(0, 0, ((UIView *)content).frame.size.width, ((UIView *)content).frame.size.height + kVerticleMargin*2 + kTitleHeight);
                [self.alertView addSubview:content];
                
            } else if ([content isKindOfClass:[NSString class]]) {
                
                self.alertView.frame  = CGRectMake(0, 0, kAlertWidth, kVerticleMargin + kContentHeight + kVerticleMargin*4);
                self.alertContentLable = [[UILabel alloc] initWithFrame:CGRectMake(0, kContentHeight + kVerticleMargin*4, kAlertWidth, kTitleHeight)];
                self.alertContentLable.font = [UIFont boldSystemFontOfSize:14.0f];
                self.alertContentLable.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
                self.alertContentLable.textAlignment = NSTextAlignmentCenter;
                self.alertContentLable.text = content;
                [self.alertView addSubview:content];
                
            } else {
                self.alertTitleLable.frame = CGRectMake(0, kVerticleMargin, kAlertWidth, kTitleHeight);
                self.alertView.frame  = CGRectMake(0, 0, kAlertWidth, kVerticleMargin*2 + kTitleHeight);
            }
            [self.alertView addSubview:self.alertTitleLable];
        } else if (content) {
            self.alertTitleLable = nil;
            if ([content isKindOfClass:[UIView class]]) {
                self.alertView.frame  = ((UIView *)content).frame;
                [self.alertView addSubview:content];
            } else if ([content isKindOfClass:[NSString class]]) {
                self.alertView.frame  = CGRectMake(0, 0, kAlertWidth, kContentHeight + kVerticleMargin*2);
                self.alertContentLable = [[UILabel alloc] initWithFrame:CGRectMake(0, kVerticleMargin, kAlertWidth, kContentHeight + kVerticleMargin*2)];
                self.alertContentLable.font = [UIFont boldSystemFontOfSize:14.0f];
                self.alertContentLable.textColor = [UIColor colorWithWhite:0.6 alpha:1.0];
                self.alertContentLable.textAlignment = NSTextAlignmentCenter;
                self.alertContentLable.text = content;
                [self.alertView addSubview:content];
            }
        } else {
            self.alertTitleLable.frame = CGRectMake(0, kVerticleMargin, kAlertWidth, kTitleHeight);
            self.alertTitleLable.text = @"Nothing!";
            self.alertView.frame  = CGRectMake(0, 0, kAlertWidth, kVerticleMargin*2 + kTitleHeight);
            [self.alertView addSubview:self.alertTitleLable];
        }

        self.alertView.backgroundColor = [UIColor whiteColor];
        
        self.alertView.center = self.center;
        self.alertView.layer.masksToBounds = YES;
        self.alertView.layer.cornerRadius = 3.0;
        self.alertView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin;
        [self addSubview:self.alertView];
        
        self.dismissBlock = completion;
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return self;
}

- (void)show {
    UIViewController *topVC = [self appRootViewController];
    [topVC.view addSubview:self];
}

- (void)dismiss {
    [self removeFromSuperview];
}

- (void)dismissAlert:(id)sender {
    CGPoint location = [sender locationInView:self.alertView];
    if (location.x < 0 || location.x > self.alertView.frame.size.width || location.y < 0 || location.y > self.alertView.frame.size.height) {
        [self removeFromSuperview];
        if (self.dismissBlock) {
            self.dismissBlock();
        }
    }
}

- (UIViewController *)appRootViewController {
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    if (newSuperview == nil) {
        return;
    }
    self.alpha = 0;
    self.alertView.alpha = 0;
    self.alertView.transform = CGAffineTransformMakeScale(1.25, 1.25);
    [UIView animateWithDuration:0.3f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.alpha = 1;
        self.alertView.alpha = 1;
        self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        [super willMoveToSuperview:newSuperview];
    }];
}

- (void)removeFromSuperview {
    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.alpha = 0;
        self.alertView.transform = CGAffineTransformMakeScale(0.75, 0.75);
        self.alertView.alpha = 0;
    } completion:^(BOOL finished) {
        [super removeFromSuperview];
    }];
}

@end
