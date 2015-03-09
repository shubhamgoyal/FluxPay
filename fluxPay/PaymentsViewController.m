//
//  PaymentsViewController.m
//  fluxPay
//
//  Created by Shubham Goyal on 26/2/15.
//  Copyright (c) 2015 Rameez Remsudeen. All rights reserved.
//

#import "PaymentsViewController.h"

@interface PaymentsViewController ()

@end

@implementation PaymentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (IBAction)buttonPressActions:(id)sender {
    
    
    NSMutableURLRequest  * request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"http://hax.sg:8000/initiate_transaction?merchant_number=6592231973&amount=700&curr=SGD"] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:10];
    
    [request setHTTPMethod: @"GET"];
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    
    
    NSData *response1 = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    
    
}

@end
