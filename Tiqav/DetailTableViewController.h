//
//  DetailTableViewController.h
//  Tiqav
//
//  Created by Lotus on 2015/03/22.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

//@class TagsTimeLineTableViewController;

#import "TagsTimeLineTableViewController.h"
#import <UIKit/UIKit.h>
#import "PictureTableViewCell.h"
#import "TagsTableViewCell.h"
#import "GetTags.h"
#import "PictureViewController.h"
@interface DetailTableViewController : UITableViewController
@property NSArray *tags;
@property UIImage *image;
@property NSString *tagId;
@end
