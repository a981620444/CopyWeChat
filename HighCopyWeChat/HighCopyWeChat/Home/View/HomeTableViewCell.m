//
//  HomeTableViewCell.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/17.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "MessageItem.h"

@implementation HomeTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self= [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLayout];
    }
    return self;
}

-(void)initLayout
{
    
    self.headImgV = [[UIImageView alloc]init];
    self.name = [[UILabel alloc]init];
    self.contentLabel = [[UILabel alloc]init];
    self.timelabel = [[UILabel alloc]init];
    
    [self.contentView addSubview:_headImgV];
    [self.contentView addSubview:_name];
    [self.contentView addSubview:_contentLabel];
    [self.contentView addSubview:_timelabel];
    
    [self.headImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@8);
        make.left.equalTo(@8);
        make.width.equalTo(@50);
        make.height.equalTo(@50);
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgV);
        make.left.equalTo(self.headImgV.mas_right).with.offset(10);
        make.right.equalTo(self.contentView.mas_right).with.offset(-90);
        make.height.equalTo(@25);
    }];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.name.mas_left);
        make.top.equalTo(self.name.mas_bottom).with.offset(3);
        make.right.equalTo(self.name.mas_right).with.offset(60);
        make.bottom.equalTo(self.headImgV.mas_bottom);
    }];
    [self.timelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.name);
        make.width.equalTo(@75);
        make.right.equalTo(self.contentView).with.offset(-8);
        make.height.equalTo(@25);
    }];
}

-(void)setCellRowData:(MessageItem *)item
{
    [self.headImgV sd_setImageWithURL:[NSURL URLWithString:item.photo]];
    self.headImgV.layer.cornerRadius = 10;
    self.headImgV.layer.masksToBounds = YES;
    self.name.text = item.userName;
    self.contentLabel.text = item.message;
    
    self.name.font = [UIFont systemFontOfSize:16];
    self.contentLabel.font = [UIFont systemFontOfSize:14];
    self.contentLabel.textColor = [UIColor lightGrayColor];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
