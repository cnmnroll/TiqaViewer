//
//  NewTimeLineTableViewController.m
//  TiqaViewer
//
//  Created by Lotus on 2015/03/25.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "NewTimeLineTableViewController.h"

@interface NewTimeLineTableViewController ()

@end

@implementation NewTimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTimeLine];
}

-(void)getTimeLine
{
    NSURL *url = [NSURL URLWithString:@"http://api.tiqav.com/search/newest.json"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSData *connection = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(!connection){
        NSLog(@"connection error");
    }
    self.responseData = [NSJSONSerialization JSONObjectWithData:connection options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@", self.responseData);
    self.tableView.delegate = self;
}
@end
