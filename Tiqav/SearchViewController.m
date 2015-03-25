//
//  SearchViewController.m
//  TiqaViewer
//
//  Created by Lotus on 2015/03/24.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()
@property NSString *searchText;
@property NSArray *searchData;
@property UISearchBar *searchBar;
@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //_searchBar.delegate = self;
    //self.navigationItem.titleView= _searchBar;
    //UINavigationController *navigationController = [[UINavigationController alloc] init];
    //[window addsubView:navigationController.view];
    //_searchBar.delegate = self;
    
    //self.searchBar.placeholder = @"検索語句を入力";
    //self.searchBar.keyboardType = UIKeyboardTypeDefault;
    //self.searchBar.showsCancelButton = YES;
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = @"検索語句を入力";
    self.navigationItem.titleView = self.searchBar;
    //[self.searchBar addt
    _searchBar.delegate = self;
    //直検索
    [self.searchBar becomeFirstResponder];

}

-(IBAction)testButton
{
    UIViewController *viewController = [[UIViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    NSLog(@"ssssssssssssssssssss");
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/* --------------------------------- searchBar setting ------------------------------*/
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [_searchBar resignFirstResponder];
    [self searchItem:self.searchText];

}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    self.searchText = searchText;
}

- (void)searchItem:(NSString *)searchText
{
    self.searchText = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                            kCFAllocatorDefault, (CFStringRef)self.searchText, NULL,
                                                                                            CFSTR(":/?#[]@!$&'()*+,;="), kCFStringEncodingUTF8));
    NSString *basic = [NSString stringWithFormat:@"http://api.tiqav.com/search.json?q=%@", self.searchText];
    NSURL *url = [NSURL URLWithString:basic];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    //[request setHTTPBody:@"GET"];
    NSData *connection = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];



    NSLog(@"%@", connection);
    if(!connection){
        NSLog(@"connection error");
    }

    self.searchData = [NSJSONSerialization JSONObjectWithData:connection options:NSJSONReadingAllowFragments error:nil];

    PictureRequestTableViewController *pictureRequestTableViewController = [[PictureRequestTableViewController alloc] init];
    pictureRequestTableViewController.responseData = self.searchData;
    //searchTableViewController.tags = self.tags;
    [self.navigationController pushViewController:pictureRequestTableViewController animated:YES];
}

@end
