//
//  ThirdAPI.h
//  MultipleAPICallHandling
//
//  Created by Bhuvan Khanna on 13/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface ThirdAPI : NSObject <ASIHTTPRequestDelegate> {
    ViewController *viewController;
}

@property(retain, nonatomic) ViewController *viewController;

-(void)thirdAPIresponse: (NSString *)urlString;

@end
