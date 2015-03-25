//
//  TimeLineTableViewController.m
//  Tiqav
//
//  Created by Lotus on 2015/03/20.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "TimeLineTableViewController.h"

@interface TimeLineTableViewController ()


@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property NSArray *tags;
@end

@implementation TimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTimeLine];

}

-(void)getTimeLine
{
    NSURL *url = [NSURL URLWithString:@"http://api.tiqav.com/search/random.json"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSData *connection = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(!connection){
        NSLog(@"connection error");
    }
    self.responseData = [NSJSONSerialization JSONObjectWithData:connection options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@", self.responseData);
    //self.tableView.delegate = self;
}






@end
