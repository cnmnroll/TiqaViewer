//
//  PictureTableViewCell.m
//  Tiqav
//
//  Created by Lotus on 2015/03/22.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "PictureTableViewCell.h"

@interface PictureTableViewCell ()


@end

@implementation PictureTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        //_mainPicture.image = _image;
        _mainPicture = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_mainPicture];
    }
    return self;

}
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGRect screen = [[UIScreen mainScreen] bounds];
    self.mainPicture.frame = CGRectMake(0, 0, screen.size.width-5, 200);
    self.mainPicture.contentMode = UIViewContentModeScaleAspectFit;
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
