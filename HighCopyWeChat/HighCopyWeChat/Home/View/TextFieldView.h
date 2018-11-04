//
//  TextFieldView.h
//  HighCopyWeChat
//
//  Created by simple on 2018/9/26.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TextFieldViewDelegate <NSObject>

-(void)sendDetailMessage:(NSString *)message;

@end

@interface TextFieldView : UIView

@property(nonatomic,strong)UIButton *voice;
@property(nonatomic,strong)UIButton *face;
@property(nonatomic,strong)UIButton *add;
@property(nonatomic,strong)UITextView *textV;

@property(nonatomic,assign)id <TextFieldViewDelegate> delegate;

-(void)initWithSubView;

@end
