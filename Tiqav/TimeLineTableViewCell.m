//
//  TimeLineTableViewCell.m
//  Tiqav
//
//  Created by Lotus on 2015/03/20.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "TimeLineTableViewCell.h"

@implementation TimeLineTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //_tag = [[NSArray alloc] init];
        _timeLineimage = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_timeLineimage];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.timeLineimage.frame = CGRectMake(0, 0, screen.size.width, 100);
}

- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
