//
//  HomeViewModel.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/19.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "HomeViewModel.h"
#import "MessageItem.h"

@implementation HomeViewModel

//解析本地json数据
-(NSMutableArray *)loadMessageDate
{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Message" ofType:@"json"]];
    NSDictionary *messageDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *allArray = [NSMutableArray array];
    for (NSDictionary *itemDic in messageDic[@"messages"][@"row"]) {
        MessageItem *item = [[MessageItem alloc]initWithItem:itemDic];
        [allArray addObject:item];
    }
    return allArray;
}

@end
