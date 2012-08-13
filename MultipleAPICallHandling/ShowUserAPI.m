//
//  ShowUserAPI.m
//  MultipleAPICallHandling
//
//  Created by Bhuvan Khanna on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ShowUserAPI.h"

@implementation ShowUserAPI
@synthesize responseString;
@synthesize viewController;

-(void)twitterShow : (NSString *)urlString {
    NSLog(@"URL : %@", urlString);
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:15];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
   // ViewController *viewController = [[ViewController alloc] init];
    
    [viewController.alertView dismissWithClickedButtonIndex:viewController.alertView.cancelButtonIndex animated:YES];
    responseString = [request responseString];
    [viewController responseFromShowUser:responseString];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    NSLog(@"Error : %@",error);
}


@end
