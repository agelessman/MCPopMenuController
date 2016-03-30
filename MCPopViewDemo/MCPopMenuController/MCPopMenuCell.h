//
//  MCPopMenuCell.h
//  qikeyun
//
//  Created by 马超 on 16/3/29.
//  Copyright © 2016年 Jerome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCPopMenuItem.h"

@interface MCPopMenuCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) MCPopMenuItem *item;
@end
