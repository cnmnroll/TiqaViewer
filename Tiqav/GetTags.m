//
//  GetTags.m
//  Tiqav
//
//  Created by Lotus on 2015/03/23.
//  Copyright (c) 2015年 ne260037.com. All rights reserved.
//

#import "GetTags.h"

@implementation GetTags

+ (NSArray *)viewDidLoad:(NSString *)id
{
    NSString *tagurl = [NSString stringWithFormat:@"http://api.tiqav.com/images/%@/tags.json", id];
    NSURL *url = [NSURL URLWithString:tagurl];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    NSData *connection = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if(!connection){
        NSLog(@"tags connection error");
    }
    NSArray *tags = [NSJSONSerialization JSONObjectWithData:connection options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@", tags);
    return tags;
}

@end
