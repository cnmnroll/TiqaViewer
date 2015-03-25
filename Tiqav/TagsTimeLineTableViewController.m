//
//  TagsTimeLineTableViewController.m
//  TiqaViewer
//
//  Created by Lotus on 2015/03/24.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "TagsTimeLineTableViewController.h"

@interface TagsTimeLineTableViewController ()

@end

@implementation TagsTimeLineTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getTimeLine];

}

-(void)getTimeLine
{
    self.tag = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                     kCFAllocatorDefault, (CFStringRef)self.tag, NULL,                                                                           CFSTR(":/?#[]@!$&'()*+,;="), kCFStringEncodingUTF8));
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.tiqav.com/search.json?q=%@", self.tag]];
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
