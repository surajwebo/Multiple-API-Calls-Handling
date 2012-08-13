//
//  ViewController.h
//  MultipleAPICallHandling
//
//  Created by Bhuvan Khanna on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController <ASIHTTPRequestDelegate, UIAlertViewDelegate>
{
    UIActivityIndicatorView *busyIndicator;
    NSString *response;
   
@public
    UIAlertView *alertView;
    
}
@property (retain, nonatomic) UIActivityIndicatorView *busyIndicator;
@property (retain, atomic) UIAlertView *alertView;
@property (retain, nonatomic) NSString *response;

-(void)responseFromPublicTimelone: (NSString *)responseJSON;
-(void)responseFromShowUser: (NSString *)responseJSON;
-(void)responseFromThirdAPI: (NSString *)responseJSON;
-(void)showLoadingScreen;
-(void)removeLoadingScreen;
- (IBAction)doAPICall:(id)sender;

@end
