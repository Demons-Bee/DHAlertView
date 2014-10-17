//
//  DHAlertView.h
//  DHAlertView
//
//  Created by 胡大函 on 14-9-24.
//  Copyright (c) 2014年 Dahan@misol. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (colorImage)

+ (UIImage *)imageWithColor:(UIColor *)color;

@end

@interface DHAlertView : UIView

- (id)initWithTitle:(NSString *)title contentView:(id)content completion:(dispatch_block_t)completion;
- (void)show;
- (void)dismiss;

@end
