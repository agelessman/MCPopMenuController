//
//  MCMenuButton.m
//  qikeyun
//
//  Created by 马超 on 16/3/29.
//  Copyright © 2016年 Jerome. All rights reserved.
//

#import "MCMenuButton.h"
#define magrin 5

@interface MCMenuButton ()

@property (nonatomic,nonnull,strong)UILabel *contenetLabel;
@property (nonatomic,nonnull,strong)UIImageView *arrowView;
@end
@implementation MCMenuButton

- (instancetype)initWithTitle:(NSString *)title
{
    self = [super init];
    if (self) {
        
        _title = title;
        _titleColor = [UIColor colorWithWhite:0.5 alpha:1.0];
        _font = 16.0;
        
        [self setupContentLabel];
        [self setupArrowView];
    }
    
    return self;
}

- (void)setupContentLabel
{
    self.contenetLabel = [[UILabel alloc] init];
    self.contenetLabel.textColor = _titleColor;
    self.contenetLabel.font = [UIFont systemFontOfSize:_font];
    self.contenetLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.contenetLabel];
}

- (void)setupArrowView
{
    self.arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"down_arrow"]];
    [self addSubview:self.arrowView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self adjustLayout];
}

#pragma mark ------------ setter ----------
- (void)setTitleColor:(UIColor *)titleColor
{
    if (_titleColor != titleColor) {
        
        _titleColor = titleColor;
        
        self.contenetLabel.textColor = titleColor;
    }
}

- (void)setFont:(double)font
{
    if (_font != font) {
        
        _font = font;
        
        self.contenetLabel.font = [UIFont systemFontOfSize:font];
        [self adjustLayout];
    }
}
#pragma mark ------------ 私有方法 ----------

/**
 *  根据内容调整位置
 */
- (void)adjustLayout
{
    //计算文本的长度
    CGFloat arrowW = 10.0;
    CGFloat arrowH = arrowW;
    
    CGFloat contentMaxW = self.frame.size.width - magrin * 3 - arrowW; ///文本的最大宽度
    
    NSMutableDictionary *contentdic = [NSMutableDictionary dictionary];
    contentdic[NSFontAttributeName] = [UIFont systemFontOfSize:_font];
    
    CGRect rect = [_title boundingRectWithSize:CGSizeMake(contentMaxW, self.bounds.size.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:contentdic context:nil];
    
    CGFloat totalW = rect.size.width + magrin + arrowW; /// 文本和箭头总的宽度
    
    CGFloat leftMagrin = (self.bounds.size.width - totalW) * 0.5;
    
    self.contenetLabel.frame = CGRectMake(leftMagrin, 0, rect.size.width, self.bounds.size.height);
    self.arrowView.frame = CGRectMake(CGRectGetMaxX(self.contenetLabel.frame)+ magrin, (self.bounds.size.height - arrowH) / 2, arrowW, arrowH);

    
    self.contenetLabel.text = _title;
}

- (void)refreshWithTitle:(NSString *)title
{
    _title = title;
    [self adjustLayout];
}
- (void)setArrowDirectionUp
{
    self.arrowView.transform = CGAffineTransformMakeRotation(M_PI_2);
}

- (void)setArrowDirectionDown
{
    self.arrowView.transform = CGAffineTransformIdentity;
}
#pragma mark --------------- 点击方法 ----------------
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    if (self.clickedBlock) {
        self.clickedBlock(self.extend);
    }
}
@end
