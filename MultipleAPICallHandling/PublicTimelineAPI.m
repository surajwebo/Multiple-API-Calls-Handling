//
//  PublicTimelineAPI.m
//  MultipleAPICallHandling
//
//  Created by Bhuvan Khanna on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PublicTimelineAPI.h"

@implementation PublicTimelineAPI
@synthesize viewController;

-(void)twitterPublicTimeline : (NSString *)urlString {
   
    NSLog(@"URL : %@", urlString);
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setDelegate:self];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:15];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    //[viewController.alertView dismissWithClickedButtonIndex:viewController.alertView.cancelButtonIndex animated:YES];
    NSString *responseString = [request responseString];
    [viewController responseFromPublicTimelone:responseString];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    NSLog(@"Error : %@",error);
}

@end
