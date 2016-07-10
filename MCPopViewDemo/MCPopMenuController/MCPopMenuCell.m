//
//  MCPopMenuCell.m
//  qikeyun
//
//  Created by 马超 on 16/3/29.
//  Copyright © 2016年 Jerome. All rights reserved.
//

#import "MCPopMenuCell.h"

@interface MCPopMenuCell ()
@property (nonatomic,strong)UIImageView *iconView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)UIView *lineView;
@end
@implementation MCPopMenuCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"MCPopMenuCell";
    MCPopMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[MCPopMenuCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) { // 初始化子控件
        
        // 选中图标
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.image = [UIImage imageNamed:@"selected"];
        iconView.hidden = YES;
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        //添加label
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
        titleLabel.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:titleLabel];
        self.titleLabel = titleLabel;
        
        //下边的线
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
        [self.contentView addSubview:line];
        self.lineView = line;
        // 3.cell的设置。。。
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setItem:(MCPopMenuItem *)item
{
    _item = item;
    
    self.iconView.hidden = !item.isSelected;
    
    self.titleLabel.textColor = !self.iconView.hidden ? [UIColor colorWithRed:10/255.0 green:190/255.0 blue:160/255.0 alpha:1.0] :[UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1.0];
    
    self.iconView.frame = CGRectMake(15, (self.bounds.size.height - 16) / 2, 16, 16);
    
    self.titleLabel.frame = CGRectMake(10 + CGRectGetMaxX(self.iconView.frame), 0, self.bounds.size.width - (10 + CGRectGetMaxX(self.iconView.frame)), self.bounds.size.height);
    self.titleLabel.text = item.itemtitle;
    
    self.lineView.frame = CGRectMake(0, self.titleLabel.bounds.size.height - 0.5, self.bounds.size.width, 0.5);
    
}



@end
