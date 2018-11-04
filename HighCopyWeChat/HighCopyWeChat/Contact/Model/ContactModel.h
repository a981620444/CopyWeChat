//
//  ContactModel.h
//  HighCopyWeChat
//
//  Created by simple on 2018/10/7.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "BaseModel.h"

@interface ContactModel : BaseModel

@property(nonatomic,copy)NSString *userId;
@property(nonatomic,copy)NSString *photo;
@property(nonatomic,copy)NSString *userName;

@end
