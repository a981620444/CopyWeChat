//
//  ContactTableViewCell.m
//  HighCopyWeChat
//
//  Created by simple on 2018/10/5.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "ContactTableViewCell.h"
#import "Masonry.h"

@implementation ContactTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLayout];
    }
    return self;
}
-(void)initLayout
{
    self.headImg = [[UIImageView alloc]init];
    self.name = [[UILabel alloc]init];
    [self.contentView addSubview:_headImg];
    [self.contentView addSubview:_name];
    
    [self.headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@8);
        make.top.equalTo(@8);
        make.size.mas_equalTo(CGSizeMake(36, 36));
    }];
    [self.name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImg.mas_right).with.offset(10);
        make.top.equalTo(self.headImg).with.offset(5);
        make.size.mas_equalTo(CGSizeMake(200, 26));
    }];
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
