//
//  Resize.m
//  TiqaViewer
//
//  Created by Lotus on 2015/03/25.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "Resize.h"

@implementation Resize

+(UIImage *)iconResize:(UIImage *)image
{
    //    int imageW = image.size.width;
    //    int imageH = image.size.height;
    //
    //float scale = (imageW > imageH)
    
    CGSize resizedSize = CGSizeMake(30, 30);
    UIGraphicsBeginImageContext(resizedSize);
    [image drawInRect:CGRectMake(0, 0, resizedSize.width, resizedSize.height)];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resizedImage;
}
@end
