//
//  SegmentedViewController.m
//  TiqaViewer
//
//  Created by Lotus on 2015/03/25.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "SegmentedViewController.h"

@interface SegmentedViewController ()

@end

@implementation SegmentedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *viewController = [self viewControllerForSegmentIndex:self.segmentedController.selectedSegmentIndex];
    [self addChildViewController:viewController];
    
    viewController.view.frame = self.contentView.bounds;
    
    [self.contentView addSubview:viewController.view];
    self.currentViewController = viewController;
    UIImage *searchIcon = [UIImage imageNamed:@"search"];
    
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchAction:)];
    self.navigationItem.rightBarButtonItem = searchButton;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIViewController *)viewControllerForSegmentIndex:(NSInteger)index {
    UIViewController *viewController;
    switch (index) {
        case 0:
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"NewTimeLineTableViewController"];
            break;
        case 1:
            viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RandomTimeLineTableViewController"];
            break;
    }
    return viewController;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)segmentChange:(UISegmentedControl *)sender {
    UIViewController *viewController = [self viewControllerForSegmentIndex:sender.selectedSegmentIndex];
    // 取得したコントローラを子コントローラとして追加する
    [self addChildViewController:viewController];
    // ビューを変更する
    [self transitionFromViewController:self.currentViewController toViewController:viewController duration:0.5
                               options:UIViewAnimationOptionTransitionCurlUp  // 変更するアニメーションを指定
                            animations:^{
                                [self.currentViewController.view removeFromSuperview];
                                viewController.view.frame = self.contentView.bounds;
                                [self.contentView addSubview:viewController.view];
                            } completion:^(BOOL finished) {
                                [viewController didMoveToParentViewController:self];
                                [self.currentViewController removeFromParentViewController];
                                self.currentViewController = viewController;
                            }];

}


-(IBAction)searchAction:(id)sender
{
    NSLog(@"aaaaa");
//    SearchViewController *searchViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"searchViewController"];
//    
//    [self.navigationController pushViewController:searchViewController animated:YES];
    SearchViewController *searchViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    
    [self.navigationController pushViewController:searchViewController animated:YES];
}
@end
