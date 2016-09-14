//
//  TwoCell.m
//  YLBaseModel
//
//  Created by Jerry on 15/12/2.
//  Copyright © 2015年 Jerry. All rights reserved.
//

#import "TwoCell.h"
#import "TestModel.h"

@interface TwoCell ()

/** 内容 */
@property (nonatomic, strong) UILabel * titleLabel;

@end

@implementation TwoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier

{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        // 1.1
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.titleLabel];

    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(15, 0, 80, 44);
    
}

- (void)setModel:(TestModel *)model
{
    _model = model;
    
    self.titleLabel.text = [NSString stringWithFormat:@"%@", _model.test];
}

@end
