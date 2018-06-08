//
//  ViewController.m
//  DynamicTextFieldObjC
//
//  Created by Marvin iOS on 2018/6/8.
//  Copyright © 2018年 Cloud-SmartGym. All rights reserved.
//

#import "ViewController.h"
#import "DynamicTitleInputView.h"

@interface ViewController () <DynamicTitileInputViewDelegate>

@end

@implementation ViewController
{
    DynamicTitleInputView *dynamicView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dynamicView = [[DynamicTitleInputView alloc] initWithTitle:@"second" color:UIColor.grayColor];
    dynamicView.delegate = self;
    dynamicView.frame = _dynamicAreaView.frame;
    [self.view addSubview:dynamicView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    dynamicView.frame = _dynamicAreaView.frame;
}

#pragma - Dynamic Title Input View Delegate
- (void)dynamicDidBeginEditing:(NSString *)text {
    NSLog(@"開始編輯: %@", text);
}

- (void)dynamicDidEndEditing:(NSString *)text {
    NSLog(@"結束編輯: %@", text);
}

#pragma - Gesture Action

- (IBAction)viewTapped:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}
@end
