//
//  PublicTimelineAPI.h
//  MultipleAPICallHandling
//
//  Created by Bhuvan Khanna on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface PublicTimelineAPI : NSObject <ASIHTTPRequestDelegate> {
    ViewController *viewController;
}

@property(retain, nonatomic) ViewController *viewController;

-(void)twitterPublicTimeline : (NSString *)urlString;

@end
