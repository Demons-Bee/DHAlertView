DHAlertView
===========

###风格很好半透明背景的AlertView,支持横竖屏切换,点击AlertView外部消失

![动画](https://github.com/DahanHu/DHAlertView/blob/master/DHAlertView/screenshots/DHAlert.gif )

####竖屏的风格如下:

![竖屏](https://github.com/DahanHu/DHAlertView/blob/master/DHAlertView/screenshots/iOS%20Simulator%20Screen%20Shot%202014%E5%B9%B410%E6%9C%8824%E6%97%A5%2011.47.51.png)

####横屏照样可以完美:
![横屏](https://github.com/DahanHu/DHAlertView/blob/master/DHAlertView/screenshots/iOS%20Simulator%20Screen%20Shot%202014%E5%B9%B410%E6%9C%8824%E6%97%A5%2011.48.34.png)

如上图中所示,对话框中的View你可以进行任意的自定义.

Usage
===========

DHAlertView *alert = [[DHAlertView alloc] initWithTitle:@"Your Title" contentView:YourCustomView completion:^{  
        // Do anything you want do in this block        
}];
    
[alert show];

想自动消失的话:

[alert dismiss];
