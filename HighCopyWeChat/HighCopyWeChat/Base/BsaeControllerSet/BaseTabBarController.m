//
//  BaseTabBarController.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/16.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeViewController.h"
#import "ContactViewController.h"
#import "FindViewController.h"
#import "MeViewController.h"

@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setUpTabbarAndNavigate
{
    HomeViewController *home = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:home];
    home.navigationItem.title = @"微信";
    homeNav.tabBarItem.title = @"微信";
    homeNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_mainframe"];
    homeNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_mainframeHL"];
    
    ContactViewController *contact = [[ContactViewController alloc]init];
    UINavigationController *contactNav = [[UINavigationController alloc]initWithRootViewController:contact];
    contact.navigationItem.title = @"通讯录";
    contactNav.tabBarItem.title = @"通讯录";
    contactNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_contacts"];
    contactNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_contactsHL"];
    
    FindViewController *find = [[FindViewController alloc]init];
    UINavigationController *findNav = [[UINavigationController alloc]initWithRootViewController:find];
    find.navigationItem.title = @"发现";
    findNav.tabBarItem.title = @"发现";
    findNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    findNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_discoverHL"];
    
    MeViewController *me = [[MeViewController alloc]init];
    UINavigationController *meNav = [[UINavigationController alloc]initWithRootViewController:me];
    me.navigationItem.title = @"我";
    meNav.tabBarItem.title = @"我";
    meNav.tabBarItem.image = [UIImage imageNamed:@"tabbar_me"];
    meNav.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_meHL"];
    
    [self addChildViewController:homeNav];
    [self addChildViewController:contactNav];
    [self addChildViewController:findNav];
    [self addChildViewController:meNav];
    
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
