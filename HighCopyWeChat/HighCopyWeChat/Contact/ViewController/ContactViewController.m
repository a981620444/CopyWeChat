//
//  ContactViewController.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/17.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "ContactViewController.h"
#import "ContactTableViewCell.h"
#import "ContactViewModel.h"
#import "ContactModel.h"
#import "UIImageView+WebCache.h"

@interface ContactViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *contactsArray;
    NSDictionary *spellDic;
    NSMutableArray *sortArray;
}
//@property(nonatomic,strong)NSDictionary *spellDic;

@end

@implementation ContactViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *contactTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStylePlain];
    contactTab.delegate = self;
    contactTab.dataSource = self;
    contactTab.rowHeight = 54;
    contactTab.sectionIndexColor = [UIColor grayColor];
    
    contactsArray = [NSMutableArray arrayWithArray:[[ContactViewModel alloc]loadContacts]];
    spellDic = [NSDictionary dictionaryWithDictionary:[self textTransformSpell:contactsArray]];
    sortArray = [NSMutableArray arrayWithArray:[self getAlphabetRank:spellDic]];
    
    [self.view addSubview:contactTab];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  [spellDic[sortArray[section]] count];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return sortArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *contactCEll = @"CONTACTCELL";
    ContactTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:contactCEll];
    if (cell == nil) {
        cell = [[ContactTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:contactCEll];
    }
    
    ContactModel *contactItem = spellDic[sortArray[indexPath.section]][indexPath.row];
    cell.name.text =contactItem.userName;
    [cell.headImg sd_setImageWithURL:[NSURL URLWithString:contactItem.photo]];
    return  cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return sortArray[section];
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return sortArray;
}
//汉字转拼音，通讯录人员按拼音分类
-(NSDictionary *)textTransformSpell:(NSMutableArray *)Array
{
    NSMutableDictionary *spellDict = [NSMutableDictionary dictionary];
    NSMutableArray *specialNameArray = [NSMutableArray array];
    for (ContactModel *item in Array)
    {
        NSMutableString *mutName = [NSMutableString stringWithString:item.userName];
        if(CFStringTransform((__bridge CFMutableStringRef)mutName, 0, kCFStringTransformMandarinLatin, NO))
        {
        }
        if (CFStringTransform((__bridge CFMutableStringRef)mutName, 0, kCFStringTransformStripDiacritics, NO))
        {
            NSString *name = [[NSString stringWithString:mutName]uppercaseString];
            NSString *firstChar = [name substringToIndex:1];
            NSMutableArray *spellArray = [spellDict objectForKey:firstChar];
            if ([firstChar characterAtIndex:0] < 'A' || [firstChar characterAtIndex:0] > 'Z')
            {
                [specialNameArray addObject:item];
            }else if ((!spellArray))
                {
                spellArray = [NSMutableArray array];
                [spellDict setValue:spellArray forKey:firstChar];
                [spellArray addObject:item];
                }else{
                    [spellArray addObject:item];
                }
         }
        
    };
    [spellDict setValue:specialNameArray forKey:@"#"];
    return spellDict;
}
//排序字母
-(NSMutableArray *)getAlphabetRank:(NSDictionary *)spellDic
{
    NSMutableArray *alphabetArray = [NSMutableArray arrayWithArray:[spellDic allKeys]];
    [alphabetArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString *str1 =obj1;
        NSString *str2 =obj2;
        return [str1 compare:str2 ];
    }];
    [alphabetArray removeObjectAtIndex:0];
    [alphabetArray addObject:@"#"];
    return alphabetArray;
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
