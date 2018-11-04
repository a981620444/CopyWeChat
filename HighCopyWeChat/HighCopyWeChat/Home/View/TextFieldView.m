//
//  TextFieldView.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/26.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "TextFieldView.h"
#import "Masonry.h"
#import "DetailViewController.h"

@interface TextFieldView ()<UITextViewDelegate>
{
    DetailViewController *sendMsg;
}

@end

@implementation TextFieldView

-(void)initWithSubView
{
    sendMsg = [[DetailViewController alloc]init];
    self.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
    
    self.voice = [UIButton buttonWithType:UIButtonTypeCustom];
    self.voice.frame = CGRectMake(10, 10, 30, 30);
    [self.voice setImage:[UIImage imageNamed:@"chat_voice"] forState:UIControlStateNormal];
    
    self.textV = [[UITextView alloc]init];
    self.textV.layer.cornerRadius = 5;
    self.textV.font = [UIFont systemFontOfSize:15];
    self.textV.returnKeyType = UIReturnKeySend;
    self.textV.delegate =self;
    
    self.face = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.face setImage:[UIImage imageNamed:@"chat_emotion"] forState:UIControlStateNormal];
    
    self.add = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.add setImage:[UIImage imageNamed:@"chat_add"] forState:UIControlStateNormal];
    
    [self addSubview:_voice];
    [self addSubview:_textV];
    [self addSubview:_face];
    [self addSubview:_add];
    
    [self.textV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.voice.mas_right).with.offset(10);
        make.top.equalTo(@7);
        make.size.mas_equalTo(CGSizeMake(240, 35));
    }];
    [self.face mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(self.textV.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    [self.add mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@10);
        make.left.equalTo(self.face.mas_right).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        if (self.textV.text.length <= 0) {
            return NO;
        }else{
            //调用代理方法。传送输入框的文字
            if ([_delegate respondsToSelector:@selector(sendDetailMessage:)]) {
                [self.delegate sendDetailMessage:_textV.text];
            }
            self.textV.text = nil;
            [self.textV endEditing:YES];
        }
    }
    return YES;
}


@end
