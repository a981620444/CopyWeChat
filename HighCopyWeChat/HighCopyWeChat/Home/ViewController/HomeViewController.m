//
//  HomeViewController.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/16.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"
#import "MessageItem.h"
#import "HomeViewModel.h"
#import "DetailViewController.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
NSMutableArray *allItemArray;
HomeViewModel *rowItem;
MessageItem *item;
}
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    
    UITableView *homeTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    [self.view addSubview:homeTab];
    homeTab.delegate = self;
    homeTab.dataSource = self;
    allItemArray = [NSMutableArray arrayWithArray:[[HomeViewModel alloc]loadMessageDate]];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 66;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return allItemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellid = @"cellIdentifier";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellid];
    }
    item = allItemArray[indexPath.row];
    [cell setCellRowData:item];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *detail = [[DetailViewController alloc]init];
    item = allItemArray[indexPath.row];
    detail.title = item.userName;
    detail.hidesBottomBarWhenPushed = YES;
    detail.receivePhoto= item.photo;
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
