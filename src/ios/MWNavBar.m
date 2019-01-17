//
//  MWNavBar.m
//  cordova-plugin-MWNavBar
//
//  Created by 尹现伟 on 2019/1/16.
//  Copyright © 2019 yinxianwei. All rights reserved.
//

#import "MWNavbar.h"

@implementation mwnavbar

- (void)setOptions:(CDVInvokedUrlCommand *)command {
    if (self.view) {
        return;
    }
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, statusRect.size.height, size.width, 44)];
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.0];
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(44, 12, size.width - 44 * 2, 20)];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    [self.webView.superview addSubview: self.view];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(viewWillLayoutSubviews:) name:CDVViewWillLayoutSubviewsNotification object:nil];
}

-(void)viewWillLayoutSubviews:(id)sender
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    [self.webView setFrame: CGRectMake(0, statusRect.size.height + self.view.frame.size.height, size.width, size.height - statusRect.size.height - self.view.frame.size.height)];
}
- (void)setTitle:(CDVInvokedUrlCommand *)command {
    [self.label setText:[command argumentAtIndex:0]];
}
- (void)setupLeftButton:(CDVInvokedUrlCommand*)command {
    if (self.leftBtn) {
        [self.leftBtn setImage:[UIImage imageNamed:[command argumentAtIndex:0]] forState:UIControlStateNormal];
        return;
    }
    self.leftBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(0, 0, 44, 44);
    [self hideLeftButton:nil];
    [self.leftBtn setImage:[UIImage imageNamed:[command argumentAtIndex:0]] forState:UIControlStateNormal];
    [self.view addSubview:self.leftBtn];
    [self.leftBtn addTarget:self action:@selector(goBack:) forControlEvents:UIControlEventTouchDown];
}
- (void)setupRightButton:(CDVInvokedUrlCommand*)command {
    if (self.rightBtn) {
        [self.rightBtn setImage:[UIImage imageNamed:[command argumentAtIndex:0]] forState:UIControlStateNormal];
        return;
    }
    CGSize size = [UIScreen mainScreen].bounds.size;
    self.rightBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = CGRectMake(size.width - 44, 0, 44, 44);
    [self hideLeftButton:nil];
    [self.rightBtn setImage:[UIImage imageNamed:[command argumentAtIndex:0]] forState:UIControlStateNormal];
    [self.view addSubview:self.rightBtn];
}
- (UIColor *)colorWithHexString:(NSString *)str_HEX  alpha:(CGFloat)alpha_range{
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:str_HEX];
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:alpha_range];
}
- (void)showRightButton:(CDVInvokedUrlCommand*)command {
    self.rightBtn.hidden = NO;
}
- (void)showLeftButton:(CDVInvokedUrlCommand*)command {
    self.leftBtn.hidden = NO;
}
- (void)hideRightButton:(CDVInvokedUrlCommand*)command {
    self.rightBtn.hidden = YES;
}
- (void)hideLeftButton:(CDVInvokedUrlCommand*)command {
    self.leftBtn.hidden = YES;
}
- (void)goBack:(id)sender {
    UIWebView *uiwebview = nil;
    if ([self.webView isKindOfClass:[UIWebView class]]) {
        uiwebview = ((UIWebView*)self.webView);
        [uiwebview goBack];
    }
}
@end
