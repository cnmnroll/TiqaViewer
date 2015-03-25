//
//  DetailTableViewController.m
//  Tiqav
//
//  Created by Lotus on 2015/03/22.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "DetailTableViewController.h"

@interface DetailTableViewController ()
@property NSArray *sectionList;

@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.sectionList = @[@"Picture", @"Tags"];
    self.tags = [GetTags viewDidLoad:self.tagId];
    NSLog(@"aaaaaaaaaaa %@" ,self.tags);
    [self.tableView registerClass:[PictureTableViewCell class] forCellReuseIdentifier:@"pictureCell"];
    [self.tableView registerClass:[TagsTableViewCell class] forCellReuseIdentifier:@"tagsCell"];
    self.tableView.tableFooterView = [[UIView alloc] init];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.sectionList[section];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    
    switch (section) {
        case 0:
            return 1;
            break;
            
        default:
            return self.tags.count;
            break;
    }
//    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    PictureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pictureCell"];
    TagsTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"tagsCell"];

    switch (indexPath.section) {
        case 0:
            cell.mainPicture.image = self.image;
            return cell;
            break;
            
        default:
            //cell.image = self.image;
            //TagsTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"tagsCell"];
            //NSLog(@"cccccccccccc = %@", self.tags[indexPath.row]);
            cell2.tagLabel.text = self.tags[indexPath.row];
            return cell2;
            break;
    }
    
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        return 200;
    } else {
        return 25;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"tag = %@", self.tags[indexPath.row]);
    if(indexPath.section == 0){
        PictureViewController *imageView = [[PictureViewController alloc] init];
        imageView.picture.image = self.image;
        [self.navigationController pushViewController:imageView animated:YES];
        
    } else {
        TagsTimeLineTableViewController *tagsTimeLineTableViewController = [[TagsTimeLineTableViewController alloc] init];
        NSLog(@"bbbbbbbbbb %@", self.tags[indexPath.row]);
        tagsTimeLineTableViewController.tag = self.tags[indexPath.row];
        [self.navigationController pushViewController:tagsTimeLineTableViewController animated:YES];
    }
}

@end
