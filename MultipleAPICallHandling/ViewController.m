//
//  ViewController.m
//  MultipleAPICallHandling
//
//  Created by Bhuvan Khanna on 09/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "PublicTimelineAPI.h"
#import "ShowUserAPI.h"
#import "ThirdAPI.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize busyIndicator;
@synthesize alertView;
@synthesize response;
 
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    alertView = [[UIAlertView alloc] initWithTitle:@"Loading..." message:@"\n\n"
                                          delegate:self
                                 cancelButtonTitle:nil
                                 otherButtonTitles:nil];
    
    UIImageView *imageViewForAlertView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 280, 280)];
    imageViewForAlertView.image = [UIImage imageNamed:@"image.png"];
	busyIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];   
	busyIndicator.frame = CGRectMake(alertView.frame.origin.x+ 130, alertView.frame.origin.y + 80, 30, 30);
	alertView.delegate = self;
	busyIndicator.backgroundColor = [UIColor clearColor];
    [alertView addSubview:imageViewForAlertView];
	[alertView addSubview:busyIndicator];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)showLoadingScreen {
	[busyIndicator startAnimating];
	[alertView show];
	
    //[self performSelector:@selector(removeLoadingScreen) withObject:nil afterDelay:10];
}

-(void)removeLoadingScreen
{
   // [self.busyIndicator stopAnimating];
    [alertView dismissWithClickedButtonIndex:alertView.cancelButtonIndex animated:YES];
    [alertView release];
    [self.alertView removeFromSuperview];
    
}

- (IBAction)doAPICall:(id)sender {
    [self showLoadingScreen];
    
    ShowUserAPI *showUser= [[ShowUserAPI alloc] init];
    showUser.viewController = self;
    [showUser twitterShow:@"https://graph.facebook.com/me?access_token=BAAFoe5z3NI0BADKWUGG0fUyY1s8RodOmlSWZCg3XOfldP03PZCgVqf1VIfi2wAiMYygbaGNo4vsW9DIpc4gmkL3oJf5ZA44CPUloKhBU4REjZCWsoGhYxHSZC4Ul1uvNhe7kUHZAPrOwZDZD"];
    //[showUser release];
    
    PublicTimelineAPI *publicTimeline = [[PublicTimelineAPI alloc] init];
    publicTimeline.viewController = self;
    [publicTimeline twitterPublicTimeline:@"https://graph.facebook.com/1215724174/permissions?access_token=BAAFoe5z3NI0BADKWUGG0fUyY1s8RodOmlSWZCg3XOfldP03PZCgVqf1VIfi2wAiMYygbaGNo4vsW9DIpc4gmkL3oJf5ZA44CPUloKhBU4REjZCWsoGhYxHSZC4Ul1uvNhe7kUHZAPrOwZDZD"];
    
    ThirdAPI *thirdAPI = [[ThirdAPI alloc] init];
    thirdAPI.viewController = self;
    [thirdAPI thirdAPIresponse:@"https://graph.facebook.com/me?access_token=BAAFoe5z3NI0BADKWUGG0fUyY1s8RodOmlSWZCg3XOfldP03PZCgVqf1VIfi2wAiMYygbaGNo4vsW9DIpc4gmkL3oJf5ZA44CPUloKhBU4REjZCWsoGhYxHSZC4Ul1uvNhe7kUHZAPrOwZDZD"];
    
}

// First API Response
-(void)responseFromShowUser: (NSString *)responseJSON{
    NSLog(@"Show User Response : %@", responseJSON);
    // Parsing Logic goes here
    
    /* PublicTimelineAPI *publicTimeline = [[PublicTimelineAPI alloc] init];
     [publicTimeline twitterPublicTimeline:@"https://graph.facebook.com/1215724174/permissions?access_token=BAAFoe5z3NI0BADKWUGG0fUyY1s8RodOmlSWZCg3XOfldP03PZCgVqf1VIfi2wAiMYygbaGNo4vsW9DIpc4gmkL3oJf5ZA44CPUloKhBU4REjZCWsoGhYxHSZC4Ul1uvNhe7kUHZAPrOwZDZD"];*/
}

// Second API Response
-(void)responseFromPublicTimelone: (NSString *)responseJSON
{
    NSLog(@"Timeline Response : %@", responseJSON);
    // Parsing Login goes here
}

// Third API Response
-(void)responseFromThirdAPI: (NSString *)responseJSON
{
    NSLog(@"Third API Response : %@", responseJSON);
    // Parsing Login goes here
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [super dealloc];
}
@end
