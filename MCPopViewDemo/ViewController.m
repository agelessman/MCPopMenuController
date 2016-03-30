//
//  ViewController.m
//  MCPopViewDemo
//
//  Created by 马超 on 16/3/30.
//  Copyright © 2016年 @qq:714080794 (交流qq). All rights reserved.
//

#import "ViewController.h"
#import "UIView+SDAutoLayout.h"
#import "MCMenuButton.h"
#import "MCPopMenuViewController.h"


@interface ViewController ()
/**
 *  头部筛选模块
 */
@property (nonatomic,strong,nonnull)UIView *topView;
@property (nonatomic,strong,nonnull)MCMenuButton *levelButton;
@property (nonatomic,strong,nonnull)MCMenuButton *groupButton;

@property (nonatomic,strong,nonnull)NSArray *leftArray;
@property (nonatomic,strong,nonnull)NSArray *rightArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"弹出菜单演示";
    
    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    self.leftArray = @[@"萧峰",@"金轮法王",@"灭绝师太",@"张三丰",@"洪七公"];
    self.rightArray = @[@"先天罡气",@"般若心经",@"法相天地",@"万剑归一",@"浴火焚天"
                        ,@"血遁",@"搜魂",@"入魔",@"尸毒"];
    
    [self setupTopView];
    
    /**
     *  特别说明
     *  在使用中可以很灵活的控制，下边的可作为参考
     *  1.弹出视图中每一个item的展示是用cell实现的，开发者可自定义cell解决显示各种样式
     *  2.在真实开发中，可能要显示的数组不是写死的，可专门也一个数据管理者(viewModel) ，可灵活运用
     *  3.在本例中每个cell携带一个item模型作为数据源，可扩展
     *  4.每个menuButton 有一个extend字段用来携带任何类型数据，在实际使用中需要根据现实的内容发请求，这个时候需要这个extend字段
     *  5.popView 可自定义一些基本参数，可修改源代码灵活修改
     *  6.转场动画已经预留出来，可自由添加
     *  7.欢迎提出宝贵意见 714080794@qq.com
     */
}

/**
 *  设置头部
 */
- (void)setupTopView
{
    self.topView = [[UIView alloc] init];
    self.topView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.topView];
    self.topView.sd_layout
    .leftSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(44)
    .topSpaceToView(self.view,64);
    
    self.levelButton = [[MCMenuButton alloc] initWithTitle:@"选择师傅"];
    [self.topView addSubview:self.levelButton];
    self.levelButton.sd_layout
    .leftSpaceToView(self.topView,0)
    .topSpaceToView(self.topView,0)
    .bottomSpaceToView(self.topView,0)
    .widthRatioToView(self.topView,0.5);
    
    self.groupButton = [[MCMenuButton alloc] initWithTitle:@"选择功法"];
    [self.topView addSubview:self.groupButton];
    self.groupButton.sd_layout
    .leftSpaceToView(self.levelButton,0)
    .topSpaceToView(self.topView,0)
    .bottomSpaceToView(self.topView,0)
    .widthRatioToView(self.topView,0.5);
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    [self.topView addSubview:lineView];
    lineView.sd_layout.leftSpaceToView(self.topView,0).rightSpaceToView(self.topView,0).bottomEqualToView(self.topView).heightIs(0.5);
    

    
    __weak typeof(self) weakSelf = self;
    //点击等级
    self.levelButton.clickedBlock = ^(id data){
        
        NSMutableArray *arrayM = [NSMutableArray array];
        
        
        for (int i = 0 ; i < self.leftArray.count ; i++ ) {
            
            MCPopMenuItem *item = [[MCPopMenuItem alloc] init];
            item.itemid = @"0";
            item.itemtitle = weakSelf.leftArray[i];
            [arrayM addObject:item];
        }
        
        MCPopMenuViewController *popVc = [[MCPopMenuViewController alloc] initWithDataSource:arrayM fromView:weakSelf.topView];
        [popVc show];
        popVc.didSelectedItemBlock = ^(MCPopMenuItem *item){
            
            [weakSelf.levelButton refreshWithTitle:item.itemtitle];
            weakSelf.levelButton.extend = item;
           
        };
    };
    
    //点击等级
    self.groupButton.clickedBlock = ^(id data){
        
        NSMutableArray *arrayM = [NSMutableArray array];
        
        for (int i = 0 ; i < self.rightArray.count ; i++ ) {
            
            MCPopMenuItem *item = [[MCPopMenuItem alloc] init];
            item.itemid = @"0";
            item.itemtitle = weakSelf.rightArray[i];
            [arrayM addObject:item];
        }
        
        MCPopMenuViewController *popVc = [[MCPopMenuViewController alloc] initWithDataSource:arrayM fromView:weakSelf.topView];
        [popVc show];
        popVc.didSelectedItemBlock = ^(MCPopMenuItem *item){
            
            [weakSelf.groupButton refreshWithTitle:item.itemtitle];
            weakSelf.groupButton.extend = item;
          
        };
    };
}
@end
