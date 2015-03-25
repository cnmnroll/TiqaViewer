//
//  PictureRequestTableViewController.m
//  TiqaViewer
//
//  Created by Lotus on 2015/03/24.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "PictureRequestTableViewController.h"
#import "DetailTableViewController.h"
@interface PictureRequestTableViewController ()
//@property NSArray *responseData;
@end

@implementation PictureRequestTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TimeLineTableViewCell class] forCellReuseIdentifier:@"timeLineCell"];
    //self.tableView.tableFooterView = [[UIView alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.responseData.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TimeLineTableViewCell *cell = (TimeLineTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    DetailTableViewController *detailView = [[DetailTableViewController alloc] init];
    detailView.image = cell.timeLineimage.image;
    //detailView.tags = cell.tags;
    detailView.tagId = cell.tagId;
    [self.navigationController pushViewController:detailView animated:YES];
    [[self tableView] deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TimeLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timeLineCell" forIndexPath:indexPath];
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        NSString *basicURL = @"http://img.tiqav.com/";
        NSDictionary *timeLineData = self.responseData[indexPath.row];
        NSString *imageId = timeLineData[@"id"];
        NSString *ext = timeLineData[@"ext"];
        //cell.tags = [GetTabs viewDidLoad:imageId];
        cell.tagId = imageId;
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@.%@", basicURL, imageId, ext]];
        NSData *urlData =[NSData dataWithContentsOfURL:url];
        
        UIImage *image = [[UIImage alloc] initWithData:urlData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.timeLineimage.image = image;
            [cell setNeedsLayout];
        });
        
    });
    return cell;
}

@end
