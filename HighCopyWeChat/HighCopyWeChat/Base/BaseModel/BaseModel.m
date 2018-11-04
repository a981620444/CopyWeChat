//
//  BaseModel.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/18.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "BaseModel.h"
#import "MJExtension.h"

@implementation BaseModel

-(instancetype)initWithItem:(id)item
{
    return [[self class] mj_objectWithKeyValues:item];
}


@end
