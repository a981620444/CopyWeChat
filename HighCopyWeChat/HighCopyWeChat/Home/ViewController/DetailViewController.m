//
//  DetailViewController.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/22.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "DetailViewController.h"
#import "ReceiveDetailTableViewCell.h"
#import "SendDetailTableViewCell.h"
#import "MessageItem.h"
#import "HomeViewModel.h"
#import "DetailViewModel.h"
#import "UIImageView+WebCache.h"
#import "TextFieldView.h"

@interface DetailViewController ()<UITableViewDataSource,UITableViewDelegate,TextFieldViewDelegate>

{
    NSMutableArray *allItemArray;
    MessageItem *item;
    DetailViewModel *rowItem;
}
@property(nonatomic,strong)UITableView *detailTab;
@property(nonatomic,strong)TextFieldView *textView;
@property(nonatomic,strong)UIView *textBackgroundV;

@end

@implementation DetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:180/255.0 green:180/255.0 blue:195/255.0 alpha:1];
    allItemArray = [NSMutableArray arrayWithArray:[[DetailViewModel alloc]loadDetailMessageDate]];//获取数据源数组
    [self setUi];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillhide:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return allItemArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *receiveCell = @"receiveCellIdentify";
    static NSString *sendCell = @"sendCellIdentify";
    ReceiveDetailTableViewCell *RECcell= [tableView dequeueReusableCellWithIdentifier:receiveCell];
    SendDetailTableViewCell *SENDcell = [tableView dequeueReusableCellWithIdentifier:sendCell];
    
    item = allItemArray[allItemArray.count - indexPath.row -1];
    
    if (item.userId == 1 ) {
        if (RECcell == nil) {
            RECcell = [[ReceiveDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:receiveCell];
        }
        item.photo = self.receivePhoto;
        [RECcell setContentData:item];
        return RECcell;
    }else{
        if (SENDcell == nil) {
            SENDcell = [[SendDetailTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:sendCell];
        }
        SENDcell.message.text = item.message;
        return SENDcell;
    }
}
//键盘弹出更改frame
-(void)keyboardWillShow:(NSNotification *)Notification
{
    NSDictionary *user = Notification.userInfo;
    double duration = [user[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect endKeyboard = [user[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat endKeyboardy = endKeyboard.origin.y;

    [UIView animateWithDuration:duration animations:^{
        self.detailTab.frame = CGRectMake(0, 0, SCREEN_WIDTH, endKeyboardy-64-49);
        self.textBackgroundV.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.textView.frame = CGRectMake(0, endKeyboardy-49-64, SCREEN_WIDTH, 49);
        [self.detailTab scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self->allItemArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    }];
}
-(void)keyboardWillhide:(NSNotification *)Notification
{
    [UIView animateWithDuration:0.25f animations:^{
        self.detailTab.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49);
        self.textView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 49);
        self.textBackgroundV.frame = CGRectMake(0, SCREEN_HEIGHT-64-49, SCREEN_WIDTH, 49);
    }];

    
}
-(void)setUi
{
    [self.view addSubview:self.detailTab];
    [self.textBackgroundV addSubview:self.textView];
    [self.view addSubview:self.textBackgroundV];
    //添加滑动取消编辑
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapPress:)];
    tapGesture.numberOfTapsRequired=1;
    [self.textBackgroundV addGestureRecognizer:tapGesture];
    //添加点击取消编辑
    UISwipeGestureRecognizer *swipeGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleSwipePress:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionDown;
    [self.textBackgroundV addGestureRecognizer:swipeGesture];
}
-(UITableView *)detailTab
{
    if (!_detailTab) {
        _detailTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
        [self.view addSubview:self.detailTab];
        self.detailTab.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1];
        self.detailTab.delegate = self;
        self.detailTab.dataSource = self;
        self.detailTab.rowHeight = UITableViewAutomaticDimension;
        self.detailTab.estimatedRowHeight = 100;
        self.detailTab.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.detailTab scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:allItemArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }
    return _detailTab;
}
-(TextFieldView *)textView
{
    if (!_textView) {
        self.textView = [[TextFieldView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        self.textView.delegate = self;
        [self.textView initWithSubView];
    }
    return _textView;
}
-(UIView *)textBackgroundV
{
    if (!_textBackgroundV) {
        self.textBackgroundV = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-64-49, SCREEN_WIDTH, 49)];
        self.textBackgroundV.backgroundColor = [UIColor clearColor];
    }
    return _textBackgroundV;
}
-(void)handleSwipePress:(UISwipeGestureRecognizer *)gestureRecognizer
{
    [self.textBackgroundV endEditing:YES];
}
-(void)handleTapPress:(UITapGestureRecognizer *)gestureRecognizer
{
    [self.textBackgroundV endEditing:YES];
}
//添加发送的信息，到数据源数组
-(void)sendDetailMessage:(NSString *)message{
    MessageItem *newItem = [MessageItem new];
    newItem.userId = 0;
    newItem.message = message;
    [allItemArray insertObject:newItem atIndex:0];
    [_detailTab reloadData];
    [UIView animateWithDuration:0.3 animations:^{
        [self.detailTab scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self->allItemArray.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    }];
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
