//
//  ReceiveDetailTableViewCell.h
//  HighCopyWeChat
//
//  Created by simple on 2018/9/22.
//  Copyright © 2018年 TestWeChat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceiveDetailTableViewCell : UITableViewCell

@property(nonatomic,strong)UIImageView *headV;
@property(nonatomic,strong)UIImageView *backgroundV;
@property(nonatomic,strong)UILabel *message;


-(void)setContentData:(id)item;
@end
