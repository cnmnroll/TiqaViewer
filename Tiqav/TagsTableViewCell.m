//
//  TagsTableViewCell.m
//  Tiqav
//
//  Created by Lotus on 2015/03/22.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "TagsTableViewCell.h"
@interface TagsTableViewCell ()

@end

@implementation TagsTableViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //_mainPicture = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.tagLabel = [[UILabel alloc] init];
        //self.tagLabel.text =
        [self.contentView addSubview:self.tagLabel];
    }
    return self;
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.tagLabel.frame = CGRectMake(5, 5, screen.size.width, 20);
    //self.mainPicture.contentMode = UIViewContentModeScaleAspectFit;
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
