//
//  MainViewController.h
//  TiqaViewer
//
//  Created by Lotus on 2015/03/25.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"
#import "Resize.h"
@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedController;

//@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIViewController *currentViewController;
@property (strong, nonatomic) IBOutlet UIView *contentView;


- (IBAction)segmentChange:(UISegmentedControl *)sender;


@end
