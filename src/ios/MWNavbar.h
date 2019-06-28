//
//  MWNavbar.h
//  cordova-plugin-MWNavBar
//
//  Created by 尹现伟 on 2019/1/16.
//  Copyright © 2019 yinxianwei. All rights reserved.
//


#import <Cordova/CDVPlugin.h>

@interface mwnavbar : CDVPlugin

@property (nonatomic, strong) UIView * view;
@property (nonatomic, strong) UILabel * label;
@property (nonatomic, strong) UIButton * leftBtn;
@property (nonatomic, strong) UIButton * rightBtn;

- (void)setOptions:(CDVInvokedUrlCommand *)command;

- (void)setTitle:(CDVInvokedUrlCommand *)command;

- (void)setupLeftButton:(CDVInvokedUrlCommand*)command;
- (void)setupRightButton:(CDVInvokedUrlCommand*)command;

- (void)showRightButton:(CDVInvokedUrlCommand*)command;
- (void)showLeftButton:(CDVInvokedUrlCommand*)command;

- (void)hideRightButton:(CDVInvokedUrlCommand*)command;
- (void)hideLeftButton:(CDVInvokedUrlCommand*)command;

- (void)loadUrl:(CDVInvokedUrlCommand*)command;
@end
