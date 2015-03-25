//
//  MainViewController.m
//  TiqaViewer
//
//  Created by Lotus on 2015/03/25.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIViewController *vc = [self viewControllerForSegmentIndex:self.segmentedController.selectedSegmentIndex];
    [self addChildViewController:vc];
    vc.view.frame = self.contentView.bounds;
    
    [self.contentView addSubview:vc.view];
    self.currentViewController = vc;
    //[self.navigationController setNavigationBarHidden:YES];
    UIImage *searchIcon = [UIImage imageNamed:@"search"];
    UIBarButtonItem *searchButton = [[UIBarButtonItem alloc] initWithImage:[Resize iconResize:searchIcon] style:UIBarButtonItemStylePlain target:self action:@selector(searchAction:)];
    UIBarButtonItem* right3 = [[UIBarButtonItem alloc]
                               initWithTitle:@"右3"
                               style:UIBarButtonItemStyleBordered
                               target:self
                               action:nil];
    //self.navigationItem.rightBarButtonItem = searchIcon;
    //self.navigationController. = YES;
    self.navigationItem.rightBarButtonItem= searchButton;
    //self.navigationItem.titleView= _segmentedController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIViewController *)viewControllerForSegmentIndex:(NSInteger)index {
    UIViewController *vc;
    switch (index) {
        case 0:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NewTLTableViewController"];
            break;
        case 1:
            vc = [self.storyboard instantiateViewControllerWithIdentifier:@"timeLineTableViewController"];
            break;
    }
    return vc;
}

- (IBAction)segmentChange:(UISegmentedControl *)sender {
    UIViewController *vc = [self viewControllerForSegmentIndex:sender.selectedSegmentIndex];
    [self addChildViewController:vc];
    [self transitionFromViewController:self.currentViewController toViewController:vc duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^{
        [self.currentViewController.view removeFromSuperview];
        vc.view.frame = self.contentView.bounds;
        [self.contentView addSubview:vc.view];
        
        
    }completion:^(BOOL finished){
        [vc didMoveToParentViewController:self];
        [self.currentViewController removeFromParentViewController];
        self.currentViewController = vc;
    }];
    
}

-(IBAction)searchAction:(id)sender
{
    SearchViewController *searchViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:searchViewController animated:YES];
}
@end
