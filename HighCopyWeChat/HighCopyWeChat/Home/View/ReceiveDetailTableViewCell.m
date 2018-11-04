//
//  ReceiveDetailTableViewCell.m
//  HighCopyWeChat
//
//  Created by simple on 2018/9/22.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import "ReceiveDetailTableViewCell.h"
#import "Masonry.h"
#import "MessageItem.h"
#import "UIImageView+WebCache.h"

@implementation ReceiveDetailTableViewCell

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
    self.selectionStyle = UITableViewCellSeparatorStyleNone;
    self.contentView.backgroundColor = [UIColor colorWithRed:205/255.0 green:205/255.0 blue:205/255.0 alpha:1];
    self.headV = [[UIImageView alloc]init];
    self.backgroundV = [[UIImageView alloc]init];
    self.message = [[UILabel alloc]init];
    
    self.message.numberOfLines = 0;
    self.message.font = [UIFont systemFontOfSize:15];

    self.backgroundV.image = [UIImage imageNamed:@"ReceiverTextNodeBkg"];
    
    [self.contentView addSubview:_headV];
    [self.contentView addSubview:_backgroundV];
    [self.contentView addSubview:_message];
    
    [self.headV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@8);
        make.left.equalTo(@8);
        make.size.mas_equalTo(CGSizeMake(36, 36));
    }];
    [self.message mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headV).with.offset(10);
        make.left.equalTo(self.headV.mas_right).with.offset(22);
        make.width.lessThanOrEqualTo(@(SCREEN_WIDTH - 66 - 66 + 5));
        make.bottom.equalTo(self.contentView).with.offset(-20);
    }];
    [self.backgroundV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headV);
        make.left.equalTo(self.headV.mas_right).with.offset(4);
        make.right.equalTo(self.message).with.offset(17);
        make.bottom.equalTo(self.contentView);
    }];
    
}
-(void)setContentData:(MessageItem *)item
{
    self.message.text = item.message;
    [self.headV sd_setImageWithURL:[NSURL URLWithString:item.photo]];
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
