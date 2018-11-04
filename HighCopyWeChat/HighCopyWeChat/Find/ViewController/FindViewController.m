//
//  FindViewController.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/17.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "FindViewController.h"
#import "FindTableViewCell.h"
#import "FriendCircleViewController.h"

#define   SCREEN_WIDTH        [UIScreen mainScreen].bounds.size.width
#define   SCREEN_HEIGHT       [UIScreen mainScreen].bounds.size.height

@interface FindViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataArray;
}
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    dataArray = @[@[@{@"headImg":@"ff_IconShowAlbum",@"title":@"朋友圈"}],
                  @[@{@"headImg":@"ff_IconQRCode",@"title":@"扫一扫"},@{@"headImg":@"ff_IconShake",@"title":@"摇一摇"}],
                  @[@{@"headImg":@"find_look",@"title":@"看一看"},
                    @{@"headImg":@"find_search",@"title":@"搜一搜"}],
                  @[@{@"headImg":@"ff_IconLocationService",@"title":@"附近的人"},
                    @{@"headImg":@"ff_IconBottle",@"title":@"漂流瓶"}],
                  @[@{@"headImg":@"find_program",@"title":@"小程序"}]];
    UITableView *findTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    findTab.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    findTab.dataSource = self;
    findTab.delegate =self;
    [self.view addSubview:findTab];
    
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    return view;
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]init];
    view.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataArray[section] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell = @"identifycell";
    FindTableViewCell *findCell = [tableView dequeueReusableCellWithIdentifier:cell];
    if (findCell == nil) {
        findCell = [[FindTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
    }
    findCell.headImg.image = [UIImage imageNamed:dataArray[indexPath.section][indexPath.row][@"headImg"]];
    findCell.title.text = dataArray[indexPath.section][indexPath.row][@"title"];
    findCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return findCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            FriendCircleViewController *vc = [[FriendCircleViewController alloc]init];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
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
