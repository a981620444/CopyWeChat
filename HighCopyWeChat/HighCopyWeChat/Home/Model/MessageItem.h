//
//  MessageItem.h
//  HighCopyWeChat
//
//  Created by simple on 2018/9/17.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "BaseModel.h"

@interface MessageItem : BaseModel

@property(nonatomic,assign)NSInteger userId;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *userName;
@property(nonatomic,copy)NSString *message;
@property(nonatomic,assign)long long createDate;

@end
