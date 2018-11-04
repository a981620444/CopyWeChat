//
//  DetailViewModel.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/24.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "DetailViewModel.h"
#import "MessageItem.h"

@implementation DetailViewModel


-(NSMutableArray *)loadDetailMessageDate
{
    NSData *detailData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"DetailMessage" ofType:@"json"]];
    NSDictionary *message = [NSJSONSerialization JSONObjectWithData:detailData options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *mutarray = [NSMutableArray array];
    for (NSDictionary *dicitem in message[@"messages"][@"row"]) {
        MessageItem *item = [[MessageItem alloc]initWithItem:dicitem];
        [mutarray addObject:item];
    }
    return mutarray;
}

@end
