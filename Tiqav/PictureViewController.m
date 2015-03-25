//
//  PictureViewController.m
//  TiqaViewer
//
//  Created by Lotus on 2015/03/24.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "PictureViewController.h"

@interface PictureViewController ()

@end

@implementation PictureViewController

-(id)init
{
    self = [super init];
    if(self){
       self.picture = [[UIImageView alloc] initWithFrame:CGRectZero]; 
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    
    self.picture.frame = CGRectMake(0, 0, screen.size.width, screen.size.height);
    self.picture.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.picture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
