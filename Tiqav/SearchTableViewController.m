//
//  TimeLineTableViewController.m
//  Ti
//
//  Created by Lotus on 2015/03/19.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "SearchTableViewController.h"

@interface SearchTableViewController ()

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TimeLineTableViewCell class] forCellReuseIdentifier:@"pictureCell"];
    //    NSLog(@"%@", self.receivedData);
//    UIBarButtonItem *reload = [[UIBarButtonItem alloc] initWithTitle:@"reload"
//                                                               style:UIBarButtonItemStyleBordered target:self action:@selector(reloadPicture:)];
    
    //self.navigationItem.rightBarButtonItem = read;
    self.navigationItem.leftItemsSupplementBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}
//-(void)reloadPicture
//{
//    [self.tableView reloadData];
//}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.receivedData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TimeLineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pictureCell"];
    cell.imageView.image = [UIImage imageNamed:@"blank.png"];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        
        NSString *url;
        NSDictionary *pictureURL = self.receivedData[indexPath.row];
        NSString *baseURL = @"http://img.tiqav.com/";
        NSString *idz = pictureURL[@"id"];
        NSString *ext = pictureURL[@"ext"];
        //cell.tags = [GetTabs viewDidLoad:imageId];
        cell.tagId = idz;
        url = [NSString stringWithFormat:@"%@%@.%@", baseURL, idz, ext];
        NSLog(@"%@", url);
        NSData *searchData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        UIImage *image = [[UIImage alloc] initWithData:searchData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.timeLineimage.image = image;
            //[self updateCell:cell atIndexPath:indexPath];
            [cell setNeedsLayout];
            NSLog(@"bbbbbbbbbb");//[self.tableView reloadData];
        });
    });
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TimeLineTableViewCell *cell = (TimeLineTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    DetailTableViewController *detailView = [self.storyboard instantiateViewControllerWithIdentifier:@"detailView"];
    detailView.image = cell.timeLineimage.image;
    //detailView.tags = cell.tags;
    detailView.tagId = cell.tagId;

    [self.navigationController pushViewController:detailView animated:YES];
    [[self tableView] deselectRowAtIndexPath:indexPath animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 100;
}

@end
