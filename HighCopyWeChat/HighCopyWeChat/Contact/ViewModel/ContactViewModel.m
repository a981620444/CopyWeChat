//
//  ContactViewModel.m
//  HighCopyWeChat
//
//  Created by simple on 2018/10/7.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "ContactViewModel.h"
#import "ContactModel.h"

@implementation ContactViewModel

-(NSMutableArray *)loadContacts
{
    NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"AddressBook" ofType:@"json"]]];
    NSDictionary *ContactsDic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSMutableArray *contactArray = [NSMutableArray array];
    for (NSDictionary *dicItem in ContactsDic[@"friends"][@"row"]) {
        ContactModel *contentItem = [[ContactModel alloc]initWithItem:dicItem];
        [contactArray addObject:contentItem];
    }
    return contactArray;
}

@end
