//
//  DynamicTitleInputView.m
//  DynamicTextFieldObjC
//
//  Created by Marvin iOS on 2018/6/8.
//  Copyright © 2018年 Cloud-SmartGym. All rights reserved.
//

#import "DynamicTitleInputView.h"

@interface DynamicTitleInputView () <UITextFieldDelegate>

@end

@implementation DynamicTitleInputView
{
    NSString *_titleString;
    UIColor *_didBeginEditColor;
    UIColor *_didEndEditColor;
    UIColor *_textColor;
}

@synthesize delegate;

- (void)customInit
{
    [[NSBundle mainBundle] loadNibNamed:@"DynamicTitleInputView" owner:self options:nil];
    [self addSubview:_containerView];
    
    UIColor *defaultYello = [UIColor colorWithRed:248.0f/255.0f green:187.0f/255.0f blue:65.0f/255.0f alpha:1.0f];
    
    _didBeginEditColor = defaultYello;
    _textColor = UIColor.blackColor;
    
    _titleLabel.text = _titleString;
    _containerView.frame = self.bounds;
    
    _titleLabel.textColor = _didEndEditColor;
    _underlineView.backgroundColor = _didEndEditColor;
    
    _inputTextField.textColor = _textColor;
    _inputTextField.tintColor = _didBeginEditColor;
    
}

- (instancetype)initWithTitle:(NSString*)title
                        color:(UIColor *)color
{
    if (self = [super init])
    {
        _titleString = title;
        _didEndEditColor = color;

        [self customInit];
    }
    
    return self;
}

#pragma Title Animation
- (void)titleLabelMoveUp
{
    _titleLabel.textColor = _didBeginEditColor;
    _underlineView.backgroundColor = _didBeginEditColor;
    
    [UIView animateWithDuration:0.25f animations:
     ^{
         [self->_titleLabel setFont:[UIFont boldSystemFontOfSize:12.0f]];
         CGAffineTransform translationTransform = CGAffineTransformMakeTranslation(0, -35);
         self->_titleLabel.transform = translationTransform;
     } completion:nil];
}

-(void)titleLabelMoveDown
{
    _titleLabel.textColor = _didEndEditColor;
    _underlineView.backgroundColor = _didEndEditColor;
    
    [UIView animateWithDuration:0.25f animations:
     ^{
         [self->_titleLabel setFont:[UIFont boldSystemFontOfSize:22.0f]];
         self->_titleLabel.transform = CGAffineTransformIdentity;
     } completion:nil];
}

#pragma - Set Color
- (void)setBeginEditColor:(UIColor*)uiColor {
    _didBeginEditColor = uiColor;
}

- (void)setTextFieldColor:(UIColor *)uiColor
{
    _textColor = uiColor;
    _inputTextField.textColor = uiColor;
}

#pragma - TextFieldDelegat
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"開始編輯");
    [self titleLabelMoveUp];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(dynamicDidBeginEditing:)])
    {
        NSString *returnString;
        if (textField.text)
        {
            returnString = textField.text;
        }
        else
        {
            returnString = @"";
        }
        
        [self.delegate dynamicDidBeginEditing:returnString];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"結束編輯");
    
    //如果有內容 title 就不移動
    if (textField.text && [textField.text length])
    {
        if (self.delegate && [self.delegate respondsToSelector:@selector(dynamicDidEndEditing:)])
        {
            NSString *returnString;
            if (textField.text)
            {
                returnString = textField.text;
            }
            else
            {
                returnString = @"";
            }
            
            [self.delegate dynamicDidEndEditing:returnString];
        }
        
        _titleLabel.textColor = _didEndEditColor;
        _underlineView.backgroundColor = _didEndEditColor;
        _inputTextField.textColor = _textColor;
        return;
    }
    
    [self titleLabelMoveDown];
    
    
}

#pragma - Btn Action


@end
