//
//  SegmentedViewController.h
//  TiqaViewer
//
//  Created by Lotus on 2015/03/25.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Resize.h"
#import "SearchViewController.h"
@interface SegmentedViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedController;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIViewController *currentViewController;

- (IBAction)segmentChange:(UISegmentedControl *)sender;


@end
