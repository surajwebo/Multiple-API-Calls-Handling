//
//  ThirdAPI.m
//  MultipleAPICallHandling
//
//  Created by Bhuvan Khanna on 13/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ThirdAPI.h"
#import "ViewController.h"

@implementation ThirdAPI
@synthesize viewController;

-(void)thirdAPIresponse: (NSString *)urlString {
    NSLog(@"URL : %@", urlString);
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    [request setRequestMethod:@"GET"];
    [request setTimeOutSeconds:15];
    [request setDelegate:self];
    [request startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    //[viewController.alertView dismissWithClickedButtonIndex:viewController.alertView.cancelButtonIndex animated:YES];
    NSString *responseString = [request responseString];
    [viewController responseFromThirdAPI:responseString];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSError *error = [request error];
    NSLog(@"Error : %@",error);
}


@end
