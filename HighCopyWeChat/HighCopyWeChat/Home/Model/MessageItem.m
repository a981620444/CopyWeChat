//
//  MessageItem.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/17.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "MessageItem.h"
#import "MJExtension.h"

@implementation MessageItem

-(instancetype)initWithItem:(id)item
{
    return [[self class] mj_objectWithKeyValues:item];
}

@end
