//
//  ViewController.m
//  DHAlertView
//
//  Created by 胡大函 on 14-9-24.
//  Copyright (c) 2014年 Dahan@misol. All rights reserved.
//

#import "ViewController.h"
#import "DHAlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *showAlert = [UIButton buttonWithType:UIButtonTypeCustom];
    [showAlert setFrame:CGRectMake(30, 64, 200, 30)];
    [showAlert setTitle:@"SHOW SYSTEM ALERT" forState:UIControlStateNormal];
    [showAlert setTitle:@"SHOW SYSTEM ALERT" forState:UIControlStateHighlighted];
    [showAlert setBackgroundImage:[UIImage imageWithColor:[UIColor brownColor]] forState:UIControlStateNormal];
    [showAlert setBackgroundImage:[UIImage imageWithColor:[UIColor darkGrayColor]] forState:UIControlStateHighlighted];
    [showAlert addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    showAlert.layer.masksToBounds = YES;
    showAlert.layer.cornerRadius = 3.0;
    [self.view addSubview:showAlert];
    
    UIButton *showAlert1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [showAlert1 setFrame:CGRectMake(30, 104, 200, 30)];
    [showAlert1 setTitle:@"SHOW ALERT" forState:UIControlStateNormal];
    [showAlert1 setTitle:@"SHOW ALERT" forState:UIControlStateHighlighted];
    [showAlert1 setBackgroundImage:[UIImage imageWithColor:[UIColor orangeColor]] forState:UIControlStateNormal];
    [showAlert1 setBackgroundImage:[UIImage imageWithColor:[UIColor darkGrayColor]] forState:UIControlStateHighlighted];
    [showAlert1 addTarget:self action:@selector(showAlert1) forControlEvents:UIControlEventTouchUpInside];
    showAlert1.layer.masksToBounds = YES;
    showAlert1.layer.cornerRadius = 3.0;
    [self.view addSubview:showAlert1];
    
}

- (void)showAlert {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"TITLE" message:@"CONTENT" delegate:nil cancelButtonTitle:@"CANCEL" otherButtonTitles:@"OTHER", nil];
    [alert show];
}

- (void)showAlert1 {
    NSArray *lableText = @[@"病人ID:",@"病人姓名:",@"设备类型:",@"起日期:",@"止日期:"];
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 250, (lableText.count + 1) * 30 + 20 + 30)];
    containerView.backgroundColor = [UIColor whiteColor];
    for (int i = 0; i < lableText.count; ++i) {
        UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, i * 35 + 10, 50, 30)];
        lable.text = lableText[i];
        lable.font = [UIFont systemFontOfSize:10.];
        lable.textAlignment = NSTextAlignmentRight;
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(50, i * 35 + 10, containerView.frame.size.width - lable.frame.size.width - 10, 30)];
        textField.textAlignment = NSTextAlignmentCenter;
        textField.layer.masksToBounds = YES;
        textField.layer.borderWidth = 0.5;
        textField.layer.borderColor = [[UIColor grayColor] CGColor];
        textField.layer.cornerRadius = 6.0f;
        textField.layer.borderColor = [UIColor grayColor].CGColor;
        [containerView addSubview:textField];
        [containerView addSubview:lable];
    }
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchBtn setFrame:CGRectMake(containerView.frame.size.width/4, containerView.frame.size.height - 30 - 10, containerView.frame.size.width/2, 30)];
    [searchBtn setTitle:@"查询" forState:UIControlStateNormal];
    [searchBtn setTitle:@"查询" forState:UIControlStateHighlighted];
    [searchBtn setBackgroundImage:[UIImage imageWithColor:[UIColor blueColor]] forState:UIControlStateNormal];
    [searchBtn setBackgroundImage:[UIImage imageWithColor:[UIColor darkGrayColor]] forState:UIControlStateHighlighted];
    [searchBtn addTarget:self action:@selector(showAlert) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.layer.masksToBounds = YES;
    searchBtn.layer.cornerRadius = 3.0;
    [containerView addSubview:searchBtn];
    
    DHAlertView *alert = [[DHAlertView alloc] initWithTitle:@"条件查询" contentView:containerView completion:^{
        NSLog(@"oouwerrrrri");
    }];
    [alert show];
}

@end