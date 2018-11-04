//
//  HomeTableViewCell.h
//  HighCopyWeChat
//
//  Created by simple on 2018/9/17.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *headImgV;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UILabel *timelabel;

-(void)setCellRowData:(id)item;

@end
