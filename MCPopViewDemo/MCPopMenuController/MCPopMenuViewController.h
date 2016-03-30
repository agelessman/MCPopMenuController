//
//  MCPopMenuViewController.h
//  qikeyun
//
//  Created by 马超 on 16/3/29.
//  Copyright © 2016年 Jerome. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MCPopMenuPresentAnimator.h"
#import "MCPopMenuDissmissAnimator.h"
#import "MCPopMenuCell.h"



@interface MCPopMenuViewController : UIViewController

/**
 *  数据源数组
 */
@property (nonatomic,strong,nonnull,readonly)NSArray *dataSource;

/**
 *  控件将要展示在哪个控件的下边
 */
@property (nonatomic,strong,nonnull,readonly)UIView *fromView;

/**
 *  点击了取消的回调
 */
@property (nonatomic,strong,nullable)void(^dissBlock)(MCPopMenuItem *_Nullable item );
/**
 *  选中了某一项的回调
 */
@property (nonatomic,strong,nullable)void(^didSelectedItemBlock)(MCPopMenuItem *_Nullable item );
/**
 *  初始化方法,初始化必须使用此方法
 *
 *  @param dataSource 数据源，是一个数组
 *  @param fromView   展示在哪个控件的下方
 */
- (instancetype _Nonnull)initWithDataSource:(NSArray * _Nonnull)dataSource fromView:(UIView * _Nonnull)fromView;

/**
 *  显示
 */
- (void)show;
@end
