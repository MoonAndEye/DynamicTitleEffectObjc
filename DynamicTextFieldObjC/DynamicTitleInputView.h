//
//  DynamicTitleInputView.h
//  DynamicTextFieldObjC
//
//  Created by Marvin iOS on 2018/6/8.
//  Copyright © 2018年 Cloud-SmartGym. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DynamicTitileInputViewDelegate <NSObject>

- (void)dynamicDidBeginEditing:(NSString*)text;
- (void)dynamicDidEndEditing:(NSString*)text;

@end

@interface DynamicTitleInputView : UIView

@property (weak, nonatomic) IBOutlet UIView *underlineView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property (strong, nonatomic) IBOutlet UIView *containerView;

@property (weak, nonatomic) id<DynamicTitileInputViewDelegate> delegate;

- (instancetype)initWithTitle:(NSString*)title color:(UIColor*)color;

- (void)setBeginEditColor:(UIColor*)uiColor;

- (void)setTextFieldColor:(UIColor*)uiColor;

@end
