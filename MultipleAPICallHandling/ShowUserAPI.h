//
//  ShowUserAPI.h
//  MultipleAPICallHandling
//
//  Created by Bhuvan Khanna on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface ShowUserAPI : NSObject <ASIHTTPRequestDelegate> {
    NSString *responseString;
    ViewController *viewController;
}
@property(retain, nonatomic) NSString *responseString;
@property(retain, nonatomic) ViewController *viewController;

-(void)twitterShow: (NSString *)urlString;

@end
